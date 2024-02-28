#include <stdint.h>
#include <string.h>
#include <doslib.h>
#include <iocslib.h>
#include "pcm8pp.h"

//
//  play in normal mode ($000x)
//
int32_t pcm8pp_play(int16_t channel, uint32_t mode, uint32_t size, uint32_t freq, void* addr) {

  register uint32_t reg_d0 asm ("d0") = 0x0000 + channel;
  register uint32_t reg_d1 asm ("d1") = mode;
  register uint32_t reg_d2 asm ("d2") = size;
  register uint32_t reg_d3 asm ("d3") = freq;
  register uint32_t reg_a1 asm ("a1") = (uint32_t)addr;

  asm volatile (
    "trap #2\n"         // trap #2
    : "+r"  (reg_d0)    // output (&input) operand
    : "r"   (reg_d1),   // input operand
      "r"   (reg_d2),   // input operand
      "r"   (reg_d3),   // input operand
      "r"   (reg_a1)    // input operand
    :                   // clobbered register
  );

  return reg_d0;
}

/*
//
//  play in array chain mode ($001x)
//
int32_t pcm8pp_play_array_chain(int16_t channel, uint32_t mode, uint32_t count, uint32_t freq, void* addr) {

  register uint32_t reg_d0 asm ("d0") = 0x0010 + channel;
  register uint32_t reg_d1 asm ("d1") = mode;
  register uint32_t reg_d2 asm ("d2") = count;
  register uint32_t reg_d3 asm ("d3") = freq;
  register uint32_t reg_a1 asm ("a1") = (uint32_t)addr;

  asm volatile (
    "trap #2\n"         // trap #2
    : "+r"  (reg_d0)    // output (&input) operand
    : "r"   (reg_d1),   // input operand
      "r"   (reg_d2),   // input operand
      "r"   (reg_d3),   // input operand
      "r"   (reg_a1)    // input operand
    :                   // clobbered register
  );

  return reg_d0;
}
*/

//
//  play in linked array chain mode ($002x)
//
int32_t pcm8pp_play_linked_array_chain(int16_t channel, uint32_t mode, uint32_t size, uint32_t freq, void* addr) {

  register uint32_t reg_d0 asm ("d0") = 0x0020 + channel;
  register uint32_t reg_d1 asm ("d1") = mode;
  register uint32_t reg_d2 asm ("d2") = size;
  register uint32_t reg_d3 asm ("d3") = freq;
  register uint32_t reg_a1 asm ("a1") = (uint32_t)addr;

  asm volatile (
    "trap #2\n"         // trap #2
    : "+r"  (reg_d0)    // output (&input) operand
    : "r"   (reg_d1),   // input operand
      "r"   (reg_d2),   // input operand
      "r"   (reg_d3),   // input operand
      "r"   (reg_a1)    // input operand
    :                   // clobbered register
  );

  return reg_d0;
}

//
//  play in extended linked array chain mode ($003x)
//
int32_t pcm8pp_play_ex_linked_array_chain(int16_t channel, uint32_t mode, uint32_t size, uint32_t freq, void* addr) {

  register uint32_t reg_d0 asm ("d0") = 0x0030 + channel;
  register uint32_t reg_d1 asm ("d1") = mode;
  register uint32_t reg_d2 asm ("d2") = size;
  register uint32_t reg_d3 asm ("d3") = freq;
  register uint32_t reg_a1 asm ("a1") = (uint32_t)addr;

  asm volatile (
    "trap #2\n"         // trap #2
    : "+r"  (reg_d0)    // output (&input) operand
    : "r"   (reg_d1),   // input operand
      "r"   (reg_d2),   // input operand
      "r"   (reg_d3),   // input operand
      "r"   (reg_a1)    // input operand
    :                   // clobbered register
  );

  return reg_d0;
}

/*
//
//  set channel mode ($007x)
//
int32_t pcm8pp_set_channel_mode(int16_t channel, uint32_t mode, uint32_t freq) {

  register uint32_t reg_d0 asm ("d0") = 0x0070 + channel;
  register uint32_t reg_d1 asm ("d1") = mode;
  register uint32_t reg_d3 asm ("d3") = freq;

  asm volatile (
    "trap #2\n"         // trap #2
    : "+r"  (reg_d0)    // output (&input) operand
    : "r"   (reg_d1),   // input operand
      "r"   (reg_d3)    // input operand
    :                   // clobbered register
  );

  return reg_d0;
}
*/
//
//  get data length ($008x)
//
int32_t pcm8pp_get_data_length(int16_t channel) {

  register uint32_t reg_d0 asm ("d0") = 0x0080 + channel;

  asm volatile (
    "trap #2\n"         // trap #2
    : "+r"  (reg_d0)    // output (&input) operand
    :                   // input operand
    :                   // clobbered register
  );

  return reg_d0;
}
/*
//
//  get channel mode ($009x)
//
int32_t pcm8pp_get_channel_mode(int16_t channel) {

  register uint32_t reg_d0 asm ("d0") = 0x0090 + channel;

  asm volatile (
    "trap #2\n"         // trap #2
    : "+r"  (reg_d0)    // output (&input) operand
    :                   // input operand
    :                   // clobbered register
  );

  return reg_d0;
}
*/

//
//  get block counter ($00Ax)
//
int32_t pcm8pp_get_block_counter(int16_t channel) {

  register uint32_t reg_d0 asm ("d0") = 0x00a0 + channel;

  asm volatile (
    "trap #2\n"         // trap #2
    : "+r"  (reg_d0)    // output (&input) operand
    :                   // input operand
    :                   // clobbered register
  );

  return reg_d0;
}

//
//  stop all channels ($0100)
//
int32_t pcm8pp_stop() {

  register uint32_t reg_d0 asm ("d0") = 0x0100;

  asm volatile (
    "trap #2\n"         // trap #2
    : "+r"  (reg_d0)    // output (&input) operand
    :                   // input operand
    :                   // clobbered register
  );

  return reg_d0;
}

//
//  pause all channels ($0101)
//
int32_t pcm8pp_pause() {

  register uint32_t reg_d0 asm ("d0") = 0x0101;

  asm volatile (
    "trap #2\n"         // trap #2
    : "+r"  (reg_d0)    // output (&input) operand
    :                   // input operand
    :                   // clobbered register
  );

  return reg_d0;
}

//
//  resume all channels ($0102)
//
int32_t pcm8pp_resume() {

  register uint32_t reg_d0 asm ("d0") = 0x0102;

  asm volatile (
    "trap #2\n"         // trap #2
    : "+r"  (reg_d0)    // output (&input) operand
    :                   // input operand
    :                   // clobbered register
  );

  return reg_d0;
}

//
//  set max channels ($01fa)
//
int32_t pcm8pp_set_max_channels(int16_t channels) {

  register uint32_t reg_d0 asm ("d0") = 0x01fa;
  register uint32_t reg_d1 asm ("d1") = channels;

  asm volatile (
    "trap #2\n"         // trap #2
    : "+r"  (reg_d0)    // output (&input) operand
    : "r"   (reg_d1)    // input operand
    :                   // clobbered register
  );

  return reg_d0;
}

//
//  set polyphonic mode ($01fc)
//
int32_t pcm8pp_set_polyphonic_mode(int16_t mode) {

  register uint32_t reg_d0 asm ("d0") = 0x01fc;
  register uint32_t reg_d1 asm ("d1") = mode;

  asm volatile (
    "trap #2\n"         // trap #2
    : "+r"  (reg_d0)    // output (&input) operand
    : "r"   (reg_d1)    // input operand
    :                   // clobbered register
  );

  return reg_d0;
}

//
//  get frequency mode ($01fd)
//
int32_t pcm8pp_get_frequency_mode() {

  register int32_t reg_d0 asm ("d0") = 0x01fd;
  register int32_t reg_d1 asm ("d1") = -1;

  asm volatile (
    "trap #2\n"         // trap #2
    : "+r"  (reg_d0)    // output (&input) operand
    : "r"   (reg_d1)    // input operand
    :                   // clobbered register
  );

  return reg_d0;
}

//
//  set frequency mode ($01fd)
//
int32_t pcm8pp_set_frequency_mode(int16_t mode) {

  register uint32_t reg_d0 asm ("d0") = 0x01fd;
  register uint32_t reg_d1 asm ("d1") = mode;

  asm volatile (
    "trap #2\n"         // trap #2
    : "+r"  (reg_d0)    // output (&input) operand
    : "r"   (reg_d1)    // input operand
    :                   // clobbered register
  );

  return reg_d0;
}

//
//  pcm8pp keep check
//
int32_t pcm8pp_isavailable() {

//  uint8_t eye_catch_addr_bytes[4];
//  for (int16_t i = 0; i < 4; i++) {
//    eye_catch_addr_bytes[i] = B_BPEEK((uint8_t*)(0x0088 + i));
//  }
//  uint8_t* eye_catch_addr = *((uint8_t**)eye_catch_addr_bytes) - 16;

  uint32_t eye_catch_addr = INTVCG(0x22) - 16; 

  uint8_t eye_catch[7];
  for (int16_t i = 0; i < 7; i++) {
    eye_catch[i] = B_BPEEK((uint8_t*)(eye_catch_addr + i));
  }

  uint8_t version = B_BPEEK((uint8_t*)(eye_catch_addr + 7));

//  return (memcmp(eye_catch, "PCM8++ ", 7) == 0 && version >= (0x20 + 83)) ? 1 : 0;
  return (memcmp(eye_catch, "PCM8++ ", 7) == 0 && version >= (0x20 + 80)) ? 1 : 0;
}

//
//  Mercury-UNIT version check
//
int32_t pcm8pp_get_mercury_version() {

  int32_t rc = 0x00;   // not exists

  // exists?
  if (BUS_ERR((uint8_t*)MERCURY_BOARD_CHECK_ADDR2, (uint8_t*)MERCURY_BOARD_CHECK_ADDR2, 2) == 0) {

    // 3.1 or 3.5/4.0
    uint8_t status = B_BPEEK((uint8_t*)MERCURY_STATUS_PORT);
    B_BPOKE((uint8_t*)MERCURY_COMMAND_PORT, status & 0b01111111);
    uint8_t status2 = B_BPEEK((uint8_t*)MERCURY_STATUS_PORT);
    rc = status2 & 0x80 ? 0x30 : 0x35;

    // 3.5 or 4.0
    if (rc == 0x35) {
      if (BUS_ERR((uint8_t*)MERCURY_BOARD_CHECK_ADDR1, (uint8_t*)MERCURY_BOARD_CHECK_ADDR1, 2) != 0) {
        rc = 0x40;
      }
    }
  }

  return rc;    // 0x00:none 0x30:~V3.1 0x35:V3.5 0x40:V4.0
}
