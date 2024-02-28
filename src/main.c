#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stat.h>
#include <doslib.h>
#include <iocslib.h>

// devices
#include "keyboard.h"
#include "himem.h"

// drivers
#include "pcm8pp.h"
//#include "mercury.h"

// codec
#include "mp3_decode.h"

// resource
#include "cp932rsc.h"

// application
#include "hmp3p.h"

//#define DEBUG

//
//  vectors
//
uint32_t g_abort_vector1;
uint32_t g_abort_vector2;

//
//  original function key mode preservation
//
static int32_t g_funckey_mode = -1;

//
//  original pcm8pp frequency mode
//
uint32_t g_original_pcm8pp_frequency_mode = 0;

// abort vector handler
static void abort_application() {

  // resume abort vectors
  INTVCS(0xFFF1, (int8_t*)g_abort_vector1);
  INTVCS(0xFFF2, (int8_t*)g_abort_vector2);  

  // resume pcm8pp settings
  if (pcm8pp_isavailable()) {
    pcm8pp_stop();
    pcm8pp_set_frequency_mode(g_original_pcm8pp_frequency_mode);
  }

  // cursor on
  C_CURON();

  // funckey mode
  if (g_funckey_mode >= 0) {
    C_FNKMOD(g_funckey_mode);
  }
  
  // flush key buffer
  while (B_KEYSNS() != 0) {
    B_KEYINP();
  }

  B_PRINT("aborted.\n");

  exit(1);
}

// show help message
static void show_help_message() {
  printf("usage: hmp3p [options] <input-file.mp3>\n");
  printf("options:\n");
  printf("     -v[n] ... volume (1-15, default:8)\n");
  printf("     -l[n] ... loop count (none:endless, default:1)\n");
  printf("     -q[n] ... mp3 quality (0:high, 1:normal, default:1)\n");
  printf("     -b<n> ... buffer size [x 64KB] (4-64,default:8)\n");
  printf("     -h    ... show help message\n");
}

// main
int32_t main(int32_t argc, uint8_t* argv[]) {

  // default return code
  int32_t rc = 1;

  // set abort vectors
  g_abort_vector1 = INTVCS(0xFFF1, (int8_t*)abort_application);
  g_abort_vector2 = INTVCS(0xFFF2, (int8_t*)abort_application);  

  // credit
  printf("HMP3P.X - High Memory MP3 player for X680x0 + Mercury-UNIT version " VERSION " by tantan\n");

  // parse command line options
  uint8_t* mp3_file_name = NULL;
  int16_t playback_volume = 8;
  int16_t loop_count = 1;
  int16_t mp3_quality = 1;
  int16_t num_chains = 8;
  int16_t use_high_memory = 0;
  int16_t playback_driver = DRIVER_NONE;

  // chain tables
  CHAIN_TABLE* chain_tables = NULL;

  // exit error message
  uint8_t error_mes[ 256 ];
  error_mes[0] = '\0';
  
  // parse command line options
  for (int16_t i = 1; i < argc; i++) {
    if (argv[i][0] == '-' && strlen(argv[i]) >= 2) {
      if (argv[i][1] == 'v') {
        playback_volume = atoi(argv[i]+2);
        if (playback_volume < 1 || playback_volume > 15 || strlen(argv[i]) < 3) {
          show_help_message();
          goto exit;
        }
      } else if (argv[i][1] == 'l') {
        loop_count = atoi(argv[i]+2);
      } else if (argv[i][1] == 'q') {
        mp3_quality = atoi(argv[i]+2);
        if (mp3_quality < 0 || mp3_quality > 1 || strlen(argv[i]) < 3) {
          show_help_message();
          goto exit;
        }
      } else if (argv[i][1] == 'b') {
        num_chains = atoi(argv[i]+2);
        if (num_chains < 4 || num_chains > 64) {
          show_help_message();
          goto exit;
        }
      } else if (argv[i][1] == 'h') {
        show_help_message();
        goto exit;
      } else {
        printf("error: unknown option (%s).\n",argv[i]);
        goto exit;
      }
    } else {
      if (mp3_file_name != NULL) {
        strcpy(error_mes, cp932rsc_too_many_files);
        goto exit;
      }
      mp3_file_name = argv[i];
    }
  }

  if (mp3_file_name == NULL || strlen(mp3_file_name) < 5) {
    show_help_message();
    goto exit;
  }

  // mercury check
  int16_t mu_version = pcm8pp_get_mercury_version();
  if (mu_version == 0) {
    printf("error: Mercury-UNIT is not available.\n");
    goto exit;
  }

  // himem check
  if (himem_isavailable()) {
    use_high_memory = 1;
  }

  // driver check
  if (pcm8pp_isavailable()) {
    playback_driver = DRIVER_PCM8PP;
  } else {
    printf("error: PCM8PP is not available.\n");
    goto exit;
  }

  // preserve original pcm8pp frequency mode
  if (pcm8pp_isavailable()) {
    g_original_pcm8pp_frequency_mode = pcm8pp_get_frequency_mode();
  }

  // cursor off
  C_CUROFF();

  if (playback_driver == DRIVER_PCM8PP) {
    // reset PCM8PP
    pcm8pp_pause();
    pcm8pp_stop();
//  } else {
//    mercury_stop();
  }

  int16_t first_play = 1;

loop:
  // file read buffers
  void* fread_buffer = NULL;
  FILE* fp = NULL;

try:

  // init chain tables
  CHAIN_TABLE* chain_tables = himem_malloc(sizeof(CHAIN_TABLE) * MAX_CHAINS, use_high_memory);
  if (chain_tables == NULL) {
    printf("error: out of memory. (cannot allocate memory for chain table)\n");
    goto catch;
  }
  for (int16_t i = 0; i < num_chains; i++) {
    chain_tables[i].buffer = NULL;
    chain_tables[i].buffer_len = 0;
    chain_tables[i].next = &(chain_tables[ ( i + 1 ) % num_chains ]);
  }
  for (int16_t i = 0; i < num_chains; i++) {
    chain_tables[i].buffer = himem_malloc(CHAIN_TABLE_BUFFER_BYTES, use_high_memory);
    if (chain_tables[i].buffer == NULL) {
      printf("error: out of memory. (cannot allocate chain table buffer)\n");
      goto catch;      
    }
  }

  // decoder
  MP3_DECODE_HANDLE mp3_decoder = { 0 };
  if (mp3_decode_init(&mp3_decoder) != 0) {
    printf("error: MP3 decoder initialization error.\n");
    goto catch;
  }

  // open input file
  fp = fopen(mp3_file_name, "rb");
  if (fp == NULL) {
    printf("error: cannot open input file (%s).\n", mp3_file_name);
    goto catch;
  }

  // read the first 10 bytes of the MP3 file
  size_t skip_offset = 0;
  printf("\rparsing MP3 ID3v2 tags...");
  int32_t ofs = mp3_decode_parse_tags(&mp3_decoder, fp);
  if (ofs < 0) {
    printf("\rerror: MP3 ID3v2 tag parse error.\x1b[0K\n");
    goto catch;
  }
  skip_offset = ofs;
  printf("\r\x1b[0K");

  // check data content size
  fseek(fp, 0, SEEK_END);
  uint32_t mp3_data_size = ftell(fp) - skip_offset;
  fseek(fp, skip_offset, SEEK_SET);

  // allocate file read buffer
  size_t fread_buffer_len = mp3_data_size;
  fread_buffer = himem_malloc(fread_buffer_len, use_high_memory);
  if (fread_buffer == NULL) {
    printf("\rerror: file read buffer memory allocation error.\n");
    goto catch;
  }

  size_t read_len = 0; 
  do {
    size_t len = fread(fread_buffer, 1, 16*1024*1024, fp);
    read_len += len;
  } while (read_len < mp3_data_size);
  fclose(fp);
  fp = NULL;

  if (mp3_decode_setup(&mp3_decoder, fread_buffer, mp3_data_size, mp3_quality) != 0) {
    printf("\rerror: MP3 decoder initialization error.\n");
    goto catch;
  }
  printf("\r\x1b[0K");

  // describe PCM attributes
  if (first_play) {

    printf("\n");

    //printf("Mercury-UNIT  : version %s\n", 
    //          mu_version == 0x30 ? "2.0 - 3.1" : 
    //          mu_version == 0x35 ? "3.5" :
    //          mu_version == 0x40 ? "4.0" : "unknown");

    printf("File name     : %s\n", mp3_file_name);
    printf("Data size     : %d [bytes]\n", mp3_data_size);
    printf("Data format   : MP3\n");

    // describe playback drivers
    printf("PCM driver    : %s\n", playback_driver == DRIVER_PCM8PP ? "PCM8PP" : "MP3P");
    printf("MP3 quality   : %s\n",
          mp3_quality == 1 ? "normal" : 
          "high");
    if (mp3_decoder.mp3_title != NULL) {
      printf("MP3 title     : %s\n", mp3_decoder.mp3_title);
    }
    if (mp3_decoder.mp3_artist != NULL) {
      printf("MP3 artist    : %s\n", mp3_decoder.mp3_artist);
    }
    if (mp3_decoder.mp3_album != NULL) {
      printf("MP3 album     : %s\n", mp3_decoder.mp3_album);
    }

    printf("\n");

    first_play = 0;
  }

  // initial buffering
  int16_t end_flag = 0;
  for (int16_t i = 0; i < num_chains; i++) {

    if (end_flag) break;

    printf("\rnow buffering (%d/%d) ... [SHIFT] to cancel.", i+1, num_chains);

    CHAIN_TABLE* cts = (CHAIN_TABLE*)chain_tables;
    size_t decoded_bytes;
    if (mp3_decode_full(&mp3_decoder, cts[i].buffer, CHAIN_TABLE_BUFFER_BYTES, &decoded_bytes) != 0) {
      printf("\rerror: mp3 decode error.\x1b[0K");
      goto catch;
    }
    cts[i].buffer_len = playback_driver == DRIVER_PCM8PP ? decoded_bytes : decoded_bytes / sizeof(int16_t);
    if (decoded_bytes == 0) {
      cts[i].next = NULL;
      end_flag = 1;
    }

    // check shift key to exit
    if (B_SFTSNS() & 0x01) {
      printf("\r\x1b[KCanceled.\n");
      goto exit;
    }

  }

#ifdef DEBUG
  for (int16_t i = 0; i < num_chains; i++) {
    printf("chain_tables[%d] self=%X,buffer=%X,buffer_len=%d,next=%X\n", i, &(chain_tables[i]), chain_tables[i].buffer, chain_tables[i].buffer_len, chain_tables[i].next);
  }
#endif

  // super visor mode
  B_SUPER(0);

  // start playing
  int32_t pcm_freq = mp3_decoder.mp3_sample_rate;
  int16_t pcm_channels = mp3_decoder.mp3_channels;
  printf("\r\x1b[0K\x1bM");
  printf("MP3 frequency : %d [Hz]\n", mp3_decoder.mp3_sample_rate);
  printf("MP3 channels  : %s\n", mp3_decoder.mp3_channels == 1 ? "mono" : "stereo");

  if (playback_driver == DRIVER_PCM8PP) {

    // PCM8PP
    int16_t pcm8pp_volume = playback_volume;
    int16_t pcm8pp_pan = 0x03;
    int16_t pcm8pp_freq = pcm_freq == 22050 && pcm_channels == 1 ? 0x0a :
                          pcm_freq == 24000 && pcm_channels == 1 ? 0x0b :
                          pcm_freq == 32000 && pcm_channels == 1 ? 0x0c :
                          pcm_freq == 44100 && pcm_channels == 1 ? 0x0d :
                          pcm_freq == 22050 && pcm_channels == 2 ? 0x1a :
                          pcm_freq == 24000 && pcm_channels == 2 ? 0x1b :
                          pcm_freq == 32000 && pcm_channels == 2 ? 0x1c :
                          pcm_freq == 44100 && pcm_channels == 2 ? 0x1d : 0x1d;
    uint32_t pcm8pp_channel_mode = ( pcm8pp_volume << 16 ) | ( pcm8pp_freq << 8 ) | pcm8pp_pan;
//    pcm8pp_play_linked_array_chain(0, pcm8pp_channel_mode, 1, pcm_freq * 256, chain_tables);
    pcm8pp_play_ex_linked_array_chain(0, pcm8pp_channel_mode, 1, pcm_freq * 256, chain_tables);

//  } else {

//    mercury_start(pcm_freq, pcm_channels, chain_tables);

  }

  B_PRINT("\nnow playing ... push [ESC]/[Q] key to quit. [SPACE] to pause.\x1b[0K");
  int16_t paused = 0;
  uint32_t pause_time;

  // dummy wait to make sure DMAC start (200 msec)
  for (int32_t t0 = ONTIME(); ONTIME() < t0 + 20;) {}

  int16_t current_chain = 0;
  uint32_t block_counter = 0;
  if (playback_driver == DRIVER_PCM8PP) {
    block_counter = (uint32_t)pcm8pp_get_block_counter(0);
//  } else {
//    block_counter = (uint32_t)mercury_get_block_address();
  }

  for (;;) {
   
    // check esc key to exit, space key to pause
    if (B_KEYSNS() != 0) {
      int16_t scan_code = B_KEYINP() >> 8;
      if (scan_code == KEY_SCAN_CODE_ESC || scan_code == KEY_SCAN_CODE_Q) {
        B_PRINT("\rstopped.\x1b[0K");
        rc = 1;
        break;
      } else if (scan_code == KEY_SCAN_CODE_SPACE) {
        if (paused) {
          if (playback_driver == DRIVER_PCM8PP) {
            pcm8pp_resume();
//          } else {
//            mercury_resume();
          }
          paused = 0;
        } else {
          if (playback_driver == DRIVER_PCM8PP) {
            pcm8pp_pause();
//          } else {
//            mercury_pause();
          }
          paused = 1;
          pause_time = ONTIME();
        }
      }
    }

    if (paused) continue;

    // exit if not playing
    if (playback_driver == DRIVER_PCM8PP) {
      if (pcm8pp_get_data_length(0) == 0) {
        if (end_flag) { 
          B_PRINT("\rfinished.\x1b[0K");
          rc = 0;
        } else {
          B_PRINT("\rerror: buffer underrun detected.\x1b[0K");
          rc = 1;
        }
        break;
      }
//    } else {
//      if (mercury_sense() == 0) {
//        if (end_flag) {
//          B_PRINT("\rfinished.\x1b[0K");
//          rc = 0;
//        } else {
//          B_PRINT("\rerror: buffer underrun detected.\x1b[0K");
//          rc = 1;
//        }
//        break;
//      }
    }

    // check buffer flip
    int16_t buffer_flip = 0;
    if (playback_driver == DRIVER_PCM8PP) {
      uint32_t bc = (uint32_t)pcm8pp_get_block_counter(0);
      if (bc != block_counter) {
        buffer_flip = 1;
        block_counter = bc;
        printf("bc=%d\n",bc);
      }
//    } else {
//      uint32_t bc = (uint32_t)mercury_get_block_address();
//      if (bc != block_counter) {
//        buffer_flip = 1;
//        block_counter = bc;
//      }
    }

    // process additional data if buffer flip happens
    if (!end_flag && buffer_flip) {

//#ifdef DEBUG
      printf("buffer flip (current chain = %d)\n", current_chain);
//#endif

      CHAIN_TABLE* cts = (CHAIN_TABLE*)chain_tables;
      CHAIN_TABLE* cta = &(cts[ current_chain ]);
      CHAIN_TABLE* ctb = &(cts[ (current_chain - 1 + num_chains) % num_chains ]);

      // cut link tantatively
      void* orig_ctb_next = ctb->next;
      ctb->next = NULL;

      size_t decoded_bytes;
//      if (mu_version <= 31 && mp3_quality == 1) {
//        if (mp3_decode_duplicate(&mp3_decoder, cta->buffer, CHAIN_TABLE_BUFFER_BYTES, &decoded_bytes) != 0) {
//          printf("\rerror: mp3 decode error.\x1b[0K");
//          goto catch;
//        }
//      } else {
        if (mp3_decode_full(&mp3_decoder, cta->buffer, CHAIN_TABLE_BUFFER_BYTES, &decoded_bytes) != 0) {
          printf("\rerror: mp3 decode error.\x1b[0K");
          goto catch;
        }
//      }
      cta->buffer_len = playback_driver == DRIVER_PCM8PP ? decoded_bytes : decoded_bytes / sizeof(int16_t);
      if (decoded_bytes == 0) {
        cta->next = NULL;
        end_flag = 1;
      }

      // resume link
      ctb->next = orig_ctb_next;

      // increment focus chain
      current_chain = ( current_chain + 1 ) % num_chains;

    }

  }

catch:

  // dummy wait to make sure DMAC stop (200 msec)
  for (int32_t t0 = ONTIME(); ONTIME() < t0 + 20;) {}

  // reset driver
  if (playback_driver == DRIVER_PCM8PP) {
    // stop
    pcm8pp_pause();
    pcm8pp_stop();
    // enable pcm8pp polyphonic mode
    if (pcm8pp_set_polyphonic_mode(-1) == 0) {
      pcm8pp_set_polyphonic_mode(1);
    }
//  } else {
//    // stop
//    mercury_stop();
  }

  // close input file
  if (fp != NULL) {
    fclose(fp);
    fp = NULL;
  }

  // reclaim file read buffers
  if (fread_buffer != NULL) {
    himem_free(fread_buffer, use_high_memory);
    fread_buffer = NULL;
  }

  // close mp3 decoder
  mp3_decode_close(&mp3_decoder);

  // reclaim chain table buffers
  for (int16_t i = 0; i < num_chains; i++) {
    if (chain_tables[i].buffer != NULL) {
      himem_free(chain_tables[i].buffer, use_high_memory);
    }
  }
  himem_free(chain_tables, use_high_memory);

  // loop check
  if (rc == 0) {
    if (loop_count == 0 || --loop_count > 0) {
      goto loop;
    }
  }

  B_PRINT("\r\n");

exit:

  // cursor on
  C_CURON();

  // function key mode
  if (g_funckey_mode >= 0) {
    C_FNKMOD(g_funckey_mode);
  }

  // resume abort vectors
  INTVCS(0xFFF1, (int8_t*)g_abort_vector1);
  INTVCS(0xFFF2, (int8_t*)g_abort_vector2);  

  // flush key buffer
  KFLUSHIO(0xff);

  // print error message
  if (error_mes[0] != '\0') {
    printf("error: %s\n", error_mes);
  }

  return rc;
}
