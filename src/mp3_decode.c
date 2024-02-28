#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "himem.h"
#include "utf16_cp932.h"
#include "mp3_decode.h"

//
//  inline helper: 24bit signed int to 16bit signed int
//
static inline int16_t scale_16bit(mad_fixed_t sample) {

  // round
  sample += (1L << (MAD_F_FRACBITS - 16));

  // clip
  if (sample >= MAD_F_ONE)
    sample = MAD_F_ONE - 1;
  else if (sample < -MAD_F_ONE)
    sample = -MAD_F_ONE;

  // quantize
  return sample >> (MAD_F_FRACBITS + 1 - 16);
}

//
//  inline helper: 24bit signed int to 12bit signed int
//
static inline int16_t scale_12bit(mad_fixed_t sample) {
  // round
  sample += (1L << (MAD_F_FRACBITS - 12));

  // clip
  if (sample >= MAD_F_ONE)
    sample = MAD_F_ONE - 1;
  else if (sample < -MAD_F_ONE)
    sample = -MAD_F_ONE;

  // quantize
  return sample >> (MAD_F_FRACBITS + 1 - 12);
}

//
//  init mp3 decoder handle
//
int32_t mp3_decode_init(MP3_DECODE_HANDLE* decode) {

  // baseline
  decode->mp3_data = NULL;
  decode->mp3_data_len = 0;
  decode->mp3_quality = 0;

  // ID3v2 tags
  decode->mp3_title = NULL;
  decode->mp3_artist = NULL;
  decode->mp3_album = NULL;

  // sampling parameters
  decode->mp3_sample_rate = -1;
  decode->mp3_channels = -1;
  decode->resample_counter = 0;

  // mad
  memset(&(decode->mad_stream), 0, sizeof(MAD_STREAM));
  memset(&(decode->mad_frame), 0, sizeof(MAD_FRAME));
  memset(&(decode->mad_synth), 0, sizeof(MAD_SYNTH));
  memset(&(decode->mad_timer), 0, sizeof(MAD_TIMER));

  decode->mp3_frame_options = 0;
  decode->current_mad_pcm = NULL;

  return 0;
}

//
//  close decoder handle
//
void mp3_decode_close(MP3_DECODE_HANDLE* decode) {

  mad_synth_finish(&(decode->mad_synth));
  mad_frame_finish(&(decode->mad_frame));
  mad_stream_finish(&(decode->mad_stream));

  if (decode->mp3_title != NULL) {
    himem_free(decode->mp3_title, 0);
  }
  if (decode->mp3_artist != NULL) {
    himem_free(decode->mp3_artist, 0);
  }
  if (decode->mp3_album != NULL) {
    himem_free(decode->mp3_album, 0);
  }

}

//
//  utf-16 to cp932
//
static void convert_utf16_to_cp932(uint8_t* cp932_buffer, uint8_t* utf16_buffer, size_t utf16_bytes) {

  // CAUTION: utf16_buffer may be odd address and word access will fail on 68000 machines

  int16_t endian = utf16_buffer[0] == 0xfe ? 1 : 0;   // 0:little, 1:big
  size_t utf16_len = ( utf16_bytes - 2 ) / 2;

  for (int16_t i = 0; i < utf16_len; i++) {
    uint16_t utf16_code = ( endian == 0 ) ? ( utf16_buffer[ 2 + i * 2 + 1 ] << 8 ) | ( utf16_buffer[ 2 + i * 2 + 0 ] ) : 
                                            ( utf16_buffer[ 2 + i * 2 + 0 ] << 8 ) | ( utf16_buffer[ 2 + i * 2 + 1 ] );
    uint16_t cp932_code = utf16_to_cp932_map[ utf16_code ];
    size_t cp932_len = strlen(cp932_buffer);
    cp932_buffer[ cp932_len ] = cp932_code >> 8;
    cp932_buffer[ cp932_len + 1 ] = cp932_code & 0xff;
    cp932_buffer[ cp932_len + 2 ] = '\0';
  }
}

//
//  parse ID3v2 tags
//
int32_t mp3_decode_parse_tags(MP3_DECODE_HANDLE* decode, FILE* fp) {

  // read the first 10 bytes of the MP3 file
  uint8_t mp3_header[10];
  size_t ret = fread(mp3_header, 1, 10, fp);
  if (ret != 10) {
    printf("error: cannot read mp3 file.\n");
    return -1;
  }

  // check if the MP3 file has an ID3v2 tag
  if (!(mp3_header[0] == 'I' && mp3_header[1] == 'D' && mp3_header[2] == '3')) {
    return 0;
  }

  // extract the total tag size (syncsafe integer)
  uint32_t total_tag_size = ((mp3_header[6] & 0x7f) << 21) | ((mp3_header[7] & 0x7f) << 14) |
                            ((mp3_header[8] & 0x7f) << 7)  | (mp3_header[9] & 0x7f);

  // ID3v2 version
  int16_t id3v2_version = mp3_header[3];
  if (id3v2_version < 0x03) {
    return total_tag_size + 10;     // does not support ID3v2.2 or before
  }

  // skip extended ID3v2 header
  if (mp3_header[5] & (1<<6)) {
    uint8_t ext_header[6];
    fread(ext_header, 1, 6, fp);
    uint32_t ext_header_size = id3v2_version == 0x03 ? *((uint32_t*)(ext_header + 0)) :
                                ((ext_header[0] & 0x7f) << 21) | ((ext_header[1] & 0x7f) << 14) |
                                ((ext_header[2] & 0x7f) << 7)  | (ext_header[3] & 0x7f);
    fseek(fp, ext_header_size, SEEK_CUR);
    total_tag_size -= 6 + ext_header_size;
  }

  uint8_t frame_header[10];
  int32_t ofs = 0;

  //printf("total tag size = %d\n",total_tag_size);

  while (ofs < total_tag_size) {

    fread(frame_header, 1, 10, fp);

    uint32_t frame_size = (id3v2_version == 0x03) ? *((uint32_t*)(frame_header + 4)) :
                            ((frame_header[4] & 0x7f) << 21) | ((frame_header[5] & 0x7f) << 14) |
                            ((frame_header[6] & 0x7f) << 7)  |  (frame_header[7] & 0x7f);    

    if (memcmp(frame_header, "0000", 4) < 0 || memcmp(frame_header, "ZZZZ", 4) > 0) {

      break;

    } else if (memcmp(frame_header, "TIT2", 4) == 0) {

      // title
      uint8_t* frame_data = himem_malloc(frame_size, 0);
      fread(frame_data, 1, frame_size, fp);
      if (frame_data[0] == 0x00) {              // ISO-8859-1
        decode->mp3_title = frame_data + 1;
      } else if (frame_data[0] == 0x01) {       // UTF-16 with BOM
        decode->mp3_title = himem_malloc(frame_size - 3 + 1, 0);
        decode->mp3_title[0] = '\0';
        convert_utf16_to_cp932(decode->mp3_title, frame_data + 1, frame_size - 1);
      }   
      himem_free(frame_data, 0);

    } else if (memcmp(frame_header, "TPE1", 4) == 0) {

      // artist
      uint8_t* frame_data = himem_malloc(frame_size, 0);
      fread(frame_data, 1, frame_size, fp);

      if (frame_data[0] == 0x00) {              // ISO-8859-1
        decode->mp3_artist = frame_data + 1;
      } else if (frame_data[0] == 0x01) {       // UTF-16 with BOM
        decode->mp3_artist = himem_malloc(frame_size - 3 + 1, 0);
        decode->mp3_artist[0] = '\0';
        convert_utf16_to_cp932(decode->mp3_artist, frame_data + 1, frame_size - 1);
      }
      himem_free(frame_data, 0);   

    } else if (memcmp(frame_header, "TALB", 4) == 0) {

      // album
      uint8_t* frame_data = himem_malloc(frame_size, 0);
      fread(frame_data, 1, frame_size, fp);

      if (frame_data[0] == 0x00) {              // ISO-8859-1
        decode->mp3_album = frame_data + 1;
      } else if (frame_data[0] == 0x01) {       // UTF-16 with BOM
        decode->mp3_album = himem_malloc(frame_size - 3 + 1, 0);
        decode->mp3_album[0] = '\0';
        convert_utf16_to_cp932(decode->mp3_album, frame_data + 1, frame_size - 1);
      }
      himem_free(frame_data, 0);

    } else {
      // other tags
      fseek(fp, frame_size, SEEK_CUR);
    }

    ofs += 10 + frame_size;

  }

  return 10 + total_tag_size;
}

//
//  setup decode operation
//
int32_t mp3_decode_setup(MP3_DECODE_HANDLE* decode, void* mp3_data, size_t mp3_data_len, int16_t mp3_quality) {

  // baseline
  decode->mp3_data = mp3_data;
  decode->mp3_data_len = mp3_data_len;
  decode->mp3_quality = mp3_quality;

  // sampling parameters
  decode->mp3_sample_rate = -1;
  decode->mp3_channels = -1;
  decode->resample_counter = 0;

  // mad frame options
  decode->mp3_frame_options = 
    decode->mp3_quality == 2 ? MAD_OPTION_QUARTERSAMPLERATE | MAD_OPTION_IGNORECRC :
    decode->mp3_quality == 1 ? MAD_OPTION_HALFSAMPLERATE    | MAD_OPTION_IGNORECRC : 0;

  mad_stream_init(&(decode->mad_stream));
  mad_frame_init(&(decode->mad_frame));
  mad_synth_init(&(decode->mad_synth));
  mad_timer_reset(&(decode->mad_timer));

  mad_stream_buffer(&(decode->mad_stream), mp3_data, mp3_data_len);

  decode->current_mad_pcm = NULL;

  return 0;
}

//
//  decode MP3 frame
//
int16_t* mp3_decode_frame(MP3_DECODE_HANDLE* decode, size_t* decoded_bytes) {

  // decode buffer
  int16_t* decode_buffer = NULL;

  // decode offset
  size_t decode_ofs = 0;

  for (;;) {
    
    if (decode->current_mad_pcm == NULL) {

      int16_t result = mad_frame_decode(&(decode->mad_frame), &(decode->mad_stream));
      if (result == -1) {
        if (decode->mad_stream.error == MAD_ERROR_BUFLEN) {
          // MP3 EOF
          break;
        } else if (MAD_RECOVERABLE(decode->mad_stream.error)) {
          continue;
        } else {
          printf("error: %s\n", mad_stream_errorstr(&(decode->mad_stream)));
          goto exit;
        }
      }

      decode->mad_frame.options = decode->mp3_frame_options;

      mad_synth_frame(&(decode->mad_synth), &(decode->mad_frame));
      mad_timer_add(&(decode->mad_timer), decode->mad_frame.header.duration);

      decode->current_mad_pcm = &(decode->mad_synth.pcm);

      if (decode->mp3_sample_rate < 0) {
        decode->mp3_sample_rate = decode->current_mad_pcm->samplerate;
        decode->mp3_channels = decode->current_mad_pcm->channels;
      }

    } 

    MAD_PCM* pcm = decode->current_mad_pcm;
    decode_buffer = himem_malloc( pcm->length * 2 * pcm->channels, 1);

    if (pcm->channels == 2) {

      for (int32_t i = 0; i < pcm->length; i++) {
        // stereo data
        decode_buffer[ decode_ofs++ ] = scale_16bit(pcm->samples[0][i]);
        decode_buffer[ decode_ofs++ ] = scale_16bit(pcm->samples[1][i]);
      }

    } else {

      for (int32_t i = 0; i < pcm->length; i++) {
        // mono data
        decode_buffer[ decode_ofs++ ] = scale_16bit(pcm->samples[0][i]);
      }

    }

    decode->current_mad_pcm = NULL;

    break;

  }

exit:

  // push resampled count
  *decoded_bytes = decode_ofs * sizeof(int16_t);

  return decode_buffer;
}

/*
//
//  decode MP3 stream
//
int32_t mp3_decode_full(MP3_DECODE_HANDLE* decode, int16_t* decode_buffer, size_t decode_buffer_bytes, size_t* decoded_bytes) {

  // default return code
  int32_t rc = -1;

  // decode counter
  int32_t decode_ofs = 0;

  for (;;) {
    
    if (decode->current_mad_pcm == NULL) {

      int16_t result = mad_frame_decode(&(decode->mad_frame), &(decode->mad_stream));
      if (result == -1) {
        if (decode->mad_stream.error == MAD_ERROR_BUFLEN) {
          // MP3 EOF
          break;
        } else if (MAD_RECOVERABLE(decode->mad_stream.error)) {
          continue;
        } else {
          printf("error: %s\n", mad_stream_errorstr(&(decode->mad_stream)));
          goto exit;
        }
      }

      decode->mad_frame.options = decode->mp3_frame_options;

      mad_synth_frame(&(decode->mad_synth), &(decode->mad_frame));
      mad_timer_add(&(decode->mad_timer), decode->mad_frame.header.duration);

      decode->current_mad_pcm = &(decode->mad_synth.pcm);

      if (decode->mp3_sample_rate < 0) {
        decode->mp3_sample_rate = decode->current_mad_pcm->samplerate;
        decode->mp3_channels = decode->current_mad_pcm->channels;
      }

    } 

    MAD_PCM* pcm = decode->current_mad_pcm;
    if (decode_ofs * sizeof(int16_t) + ( pcm->length * 2 * pcm->channels ) > decode_buffer_bytes) {
      // no more buffer space to write
      break;
    }

    if (pcm->channels == 2) {

      for (int32_t i = 0; i < pcm->length; i++) {
        // stereo data
        decode_buffer[ decode_ofs++ ] = scale_16bit(pcm->samples[0][i]);
        decode_buffer[ decode_ofs++ ] = scale_16bit(pcm->samples[1][i]);
      }

    } else {

      for (int32_t i = 0; i < pcm->length; i++) {
        // mono data
        decode_buffer[ decode_ofs++ ] = scale_16bit(pcm->samples[0][i]);
      }

    }

    decode->current_mad_pcm = NULL;

  }

  // success
  rc = 0;

exit:

  // push resampled count
  *decoded_bytes = decode_ofs * sizeof(int16_t);

  return rc;
}
*/

/*
//
//  decode MP3 stream with duplication
//  mercury v2.0 ~ 3.1 はハーフレートを直接再生できないので、2度書きする
//
int32_t mp3_decode_duplicate(MP3_DECODE_HANDLE* decode, int16_t* decode_buffer, size_t decode_buffer_bytes, size_t* decoded_bytes) {

  // default return code
  int32_t rc = -1;

  // decode counter
  int32_t decode_ofs = 0;

  for (;;) {
    
    if (decode->current_mad_pcm == NULL) {

      int16_t result = mad_frame_decode(&(decode->mad_frame), &(decode->mad_stream));
      if (result == -1) {
        if (decode->mad_stream.error == MAD_ERROR_BUFLEN) {
          // MP3 EOF
          break;
        } else if (MAD_RECOVERABLE(decode->mad_stream.error)) {
          continue;
        } else {
          printf("error: %s\n", mad_stream_errorstr(&(decode->mad_stream)));
          goto exit;
        }
      }

      decode->mad_frame.options = decode->mp3_frame_options;

      mad_synth_frame(&(decode->mad_synth), &(decode->mad_frame));
      mad_timer_add(&(decode->mad_timer), decode->mad_frame.header.duration);

      decode->current_mad_pcm = &(decode->mad_synth.pcm);

      if (decode->mp3_sample_rate < 0) {
        decode->mp3_sample_rate = decode->current_mad_pcm->samplerate;
        decode->mp3_channels = decode->current_mad_pcm->channels;
      }

    } 

    MAD_PCM* pcm = decode->current_mad_pcm;
    if (decode_ofs * sizeof(int16_t) + ( pcm->length * 2 * pcm->channels ) > decode_buffer_bytes) {
      // no more buffer space to write
      break;
    }

    if (pcm->channels == 2) {

      for (int32_t i = 0; i < pcm->length; i++) {
        // stereo data
        decode_buffer[ decode_ofs++ ] = scale_16bit(pcm->samples[0][i]);
        decode_buffer[ decode_ofs++ ] = scale_16bit(pcm->samples[1][i]);
        decode_buffer[ decode_ofs++ ] = scale_16bit(pcm->samples[0][i]);
        decode_buffer[ decode_ofs++ ] = scale_16bit(pcm->samples[1][i]);
      }

    } else {

      for (int32_t i = 0; i < pcm->length; i++) {
        // mono data
        decode_buffer[ decode_ofs++ ] = scale_16bit(pcm->samples[0][i]);
        decode_buffer[ decode_ofs++ ] = scale_16bit(pcm->samples[0][i]);
      }

    }

    decode->current_mad_pcm = NULL;

  }

  // success
  rc = 0;

exit:

  // push resampled count
  *decoded_bytes = decode_ofs * sizeof(int16_t);

  return rc;
}
*/

/*
//
//  decode MP3 stream with resampling for PCM8A
//
int32_t mp3_decode_resample(MP3_DECODE_HANDLE* decode, int16_t* resample_buffer, size_t resample_buffer_len, int16_t resample_freq, size_t* resampled_len) {

  // default return code
  int32_t rc = -1;

  // down sampling counter
  int32_t resample_ofs = 0;

  for (;;) {
    
    if (decode->current_mad_pcm == NULL) {

      int16_t result = mad_frame_decode(&(decode->mad_frame), &(decode->mad_stream));
      if (result == -1) {
        if (decode->mad_stream.error == MAD_ERROR_BUFLEN) {
          // MP3 EOF
          break;
        } else if (MAD_RECOVERABLE(decode->mad_stream.error)) {
          continue;
        } else {
          printf("error: %s\n", mad_stream_errorstr(&(decode->mad_stream)));
          goto exit;
        }
      }

      decode->mad_frame.options = decode->mp3_frame_options;
      mad_synth_frame(&(decode->mad_synth), &(decode->mad_frame));
      mad_timer_add(&(decode->mad_timer), decode->mad_frame.header.duration);

      decode->current_mad_pcm = &(decode->mad_synth.pcm);

      if (decode->mp3_sample_rate < 0) {
        decode->mp3_sample_rate = decode->current_mad_pcm->samplerate;
        decode->mp3_channels = decode->current_mad_pcm->channels;
//        printf("MP3 frequency : %d\n", decode->mp3_sample_rate);
//        printf("MP3 channels  : %s\n", decode->mp3_channels == 1 ? "mono" : "stereo");
      }

    } 

    MAD_PCM* pcm = decode->current_mad_pcm;
    if (resample_ofs + pcm->length > resample_buffer_len) {
      // no more buffer space to write
      break;
    }

    if (pcm->channels == 2) {

      for (int32_t i = 0; i < pcm->length; i++) {

        // down sampling
        decode->resample_counter += resample_freq;
        if (decode->resample_counter < pcm->samplerate) {
          continue;
        }

        // stereo to mono
        resample_buffer[ resample_ofs++ ] = ( scale_16bit(pcm->samples[0][i]) + scale_16bit(pcm->samples[1][i]) ) / 2 / 16;
        decode->resample_counter -= pcm->samplerate;

      }

    } else {

      for (int32_t i = 0; i < pcm->length; i++) {

        // down sampling
        decode->resample_counter += resample_freq;
        if (decode->resample_counter < pcm->samplerate) {
          continue;
        }
    
        resample_buffer[ resample_ofs++ ] = scale_12bit(pcm->samples[0][i]);
        decode->resample_counter -= pcm->samplerate;

      }

    }

    decode->current_mad_pcm = NULL;

  }

  // success
  rc = 0;

exit:

  // push resampled count
  *resampled_len = resample_ofs;

  return rc;
}
*/