  .align 2

  .globl _cp932rsc_too_many_files
  .globl _cp932rsc_file_open_error
  .globl _cp932rsc_file_read_error
  .globl _cp932rsc_header_read_error
  .globl _cp932rsc_himem_not_available
  .globl _cp932rsc_pcm8_not_available
  .globl _cp932rsc_pcm8pp_not_available
  .globl _cp932rsc_himem_shortage
  .globl _cp932rsc_mainmem_shortage
  .globl _cp932rsc_format_error
  .globl _cp932rsc_format_error2
  .globl _cp932rsc_4dot_width_error
  .globl _cp932rsc_small_width_error
  .globl _cp932rsc_large_width_error
  .globl _cp932rsc_large_width_error2
  .globl _cp932rsc_small_height_error
  .globl _cp932rsc_large_height_error
  .globl _cp932rsc_time_scale_error
  .globl _cp932rsc_pcm_format_error
  .globl _cp932rsc_delta_copy_error
  .globl _cp932rsc_frame_pcm_size_error

  .data

_cp932rsc_too_many_files:
  .dc.b '指定したMP3ファイルの数が多すぎます。',$00

_cp932rsc_file_open_error:
  .dc.b '指定ファイルがオープンできませんでした。',$00

_cp932rsc_file_read_error:
  .dc.b 'ファイル全体の読み込みができませんでした。',$00

_cp932rsc_header_read_error:
  .dc.b 'ヘッダーの読み込みができませんでした。',$00

_cp932rsc_himem_not_available:
  .dc.b 'ハイメモリドライバが組み込まれていません。',$00

_cp932rsc_pcm8_not_available:
  .dc.b 'PCM8A/PCM8PPのいずれかを組み込む必要があります。',$00

_cp932rsc_pcm8pp_not_available:
  .dc.b '16biPCMデータ再生にはPCM8PPを組み込む必要があります。',$00

_cp932rsc_himem_shortage:
  .dc.b 'ハイメモリエリアが不足しています。',$00

_cp932rsc_mainmem_shortage:
  .dc.b 'メインメモリエリアが不足しています。',$00

_cp932rsc_format_error:
  .dc.b 'ISD形式のファイルではありません。',$00

_cp932rsc_format_error2:
  .dc.b 'ISPR-V3.0/ISPR-V4.0無圧縮データのみ対応しています。',$00

_cp932rsc_4dot_width_error:
  .dc.b '画像横幅は4の倍数のみ対応しています。',$00

_cp932rsc_small_width_error:
  .dc.b '画像横幅128ドット以上のみ対応しています。',$00

_cp932rsc_large_width_error:
  .dc.b '長方形ピクセルモードでは画像横幅256ドット以下のみ対応しています。',$00

_cp932rsc_large_width_error2:
  .dc.b '正方形ピクセルモードでは画像横幅384ドット以下のみ対応しています。',$00

_cp932rsc_small_height_error:
  .dc.b '画像縦幅1ドット以上のみ対応しています。',$00

_cp932rsc_large_height_error:
  .dc.b '画像縦幅256ドット以下のみ対応しています。',$00

_cp932rsc_time_scale_error:
  .dc.b '未対応の時間間隔です。',$00

_cp932rsc_pcm_format_error:
  .dc.b '未対応のPCMフォーマットです。',$00

_cp932rsc_delta_copy_error:
  .dc.b '未対応の行間隔データです。',$00

_cp932rsc_frame_pcm_size_error:
  .dc.b '1フレームあたりのPCMサイズが大きすぎます。',$00

  .end