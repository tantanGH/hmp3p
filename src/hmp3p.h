#ifndef __H_HMP3P__
#define __H_HMP3P__

#define VERSION "0.1.0 (2024/02/28)"

#define MAX_PATH_LEN (256)

#define MAX_CHAINS (128)
//#define CHAIN_TABLE_BUFFER_BYTES (0xff00)
#define CHAIN_TABLE_BUFFER_BYTES (44100*2*2*3)    // 44.1kHz 16bit stereo 3sec

#define DRIVER_NONE    (-1)
#define DRIVER_PCM8PP  (0)

//
//  extended link array chain table for pcm8pp
//
typedef struct {
    void* buffer;
    uint32_t buffer_len;
    void* next;
} CHAIN_TABLE;

#endif