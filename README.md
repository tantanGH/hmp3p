# HMP3P.X

A simple high memory MP3 player for Human68k/X680x0 + Mercury-UNIT

---

## About This

Human68k ハイメモリ環境専用のMP3音楽プレーヤです。

320kbps(上限)のMP3データや、VBR(Variable Bit Rate)のMP3データを Mercury-UNITを使って 44.1kHz 16bit ステレオ PCM で再生可能です。アルバムアートワークおよびID3タグの表示に対応しています。

Mercury-UNITが無い場合は内蔵ADPCMでも再生できます。

実行ファイルは3つ同梱されています。

 - HMP3P.X ... 68000/68030/68040/68060 のすべてのMPUモードに対応
 - HMP3P030.X ... 68030/68040/68060 のMPUモードに対応(より高速動作します)
 - HMP3P060.X ... 68060専用(さらに高速に動作します)

固定小数点演算しか行っていないため、FPUの有無や、FLOATドライバの種類によるパフォーマンスの違いはありません。

セレクタ[MP3SEL.X](https://github.com/tantanGH/mp3sel/)と組み合わせての利用をおすすめします。

FLACデータの再生には[HFLAP.X](https://github.com/tantanGH/hflap/)をご利用ください。

---

## 動作環境 (X68000実機 + PhantomX)

* X68000実機
* PhantomX 1.3以降 + ハイメモリ128MB以上
* Raspberry Pi 4B
* MPU ライトバックモード (ライトスルーモードでは処理が追いつきません)
* Mercury-UNIT または PilederX または KeplerX
* [TS16DRVp.X ハイメモリドライバ](https://hauoli.x68kbbs.com/)
* [PCM8PP.X 0.83d](http://retropc.net/x68000/software/hardware/mercury/pcm8pp/)
* 内蔵ADPCMで再生する場合は [PCM8A.X 1.02.1 (TcbnErik氏のハイメモリ対応版)](https://github.com/kg68k/pcm8a/releases/tag/v1.02.1)

MP3データファイルは PhantomX の WindrvXM 機能を利用してSDカードに直接保存することを強くお勧めします。

---

## 動作環境 (X68030実機 + 060turbo)

* X68030実機
* 060turbo + ハイメモリ128MB (64MBでも動作するかも)
* MPU コピーバックモード (060turbo.sysに`-cm1`オプション付与)
* Mercury-UNIT または PilederX または KeplerX
* [PCM8PP.X 0.83d](http://retropc.net/x68000/software/hardware/mercury/pcm8pp/)
* 内蔵ADPCMで再生する場合は [PCM8A.X 1.02.1 (TcbnErik氏のハイメモリ対応版)](https://github.com/kg68k/pcm8a/releases/tag/v1.02.1)

必ずコピーバックモードを使用してください。(060turbo.sysに`-cm1`をつける)

Mercury-UNITを使用する場合、現在の実装ではハーフレート再生のみ処理が間に合います。`-q1`オプションを使って再生するようにしてください。バッファサイズを極端に大きくとれば(例えば`-b32`など)44.1kHzの再生も可能ですが、再生開始までの時間が長くなります。

内蔵ADPCMの場合は44.1kHzからのダウンサンプリング再生がほぼ間に合います。もし間に合わない場合は`-b8`など、バッファサイズをすこし多めにとってみてください。

MP3データファイルをSCSIディスクから読む場合、`-s`オプションをつけるか、TS16FILE.X を使用してください。

---

## 動作環境 (エミュレータ)

XEiJ 68030/68060 でのみ確認しています。0.26.01.08以降でMercury-UNIT対応となりました。

* XEiJ 060turboモード MPUクロック50MHz以上 + 060turbo.sys
* XEiJ X68030モード MPUクロック250MHz以上 + TS16DRVp.X
* [PCM8PP.X 0.83d](http://retropc.net/x68000/software/hardware/mercury/pcm8pp/)
* 内蔵ADPCMで再生する場合は [PCM8A.X 1.02.1 (TcbnErik氏のハイメモリ対応版)](https://github.com/kg68k/pcm8a/releases/tag/v1.02.1)

MP3データファイルはHFSから読むことをお勧めします。

XEiJでPCM8PP.Xを使用する場合、常駐前に MKMU.R を実行する必要があります。

---

## 使い方

お使いの環境にあわせて適宜 HMP3P030.X または HMP3P060.X を HMP3P.X にリネームするなどしてください。

PCM8PP.X をあらかじめ常駐させておきます。内蔵ADPCMで再生する場合は PCM8A.X を使用してください。

        usage: hmp3p [options] <input-file.mp3>
        options:
             -l[n] ... loop count (none:endless, default:1)
             -v<n> ... volume (1-15, default:6)
             -q<n> ... mp3 quality (0:high, 1:normal, default:0)
             -t<n> ... album art display brightness (1-100, default:off)
             -b<n> ... buffer size [x 64KB] (3-32,default:4)
             -n    ... no progress bar
             -s    ... use main memory for file reading (SCSI disk)
             -h    ... show help message

音割れを防ぐために、PCM8PP/PCM8Aの音量設定は少し小さめとなっています。

アルバムアートワークを表示させるには `-t80` など、表示輝度パーセント値を指定して `-t` オプションを使ってください。
ベースラインJPEGのみ対応しています。プログレッシブJPEGやPNGには対応していません。

`-q1` でハーフレート再生となり処理負担が減りますが、Mercury-UNIT V3.5以上が必須となります。

WindrvXM/VDISKドライブ以外のSCSIドライブ等からMP3を読み込む場合は `-s` オプションをつけるか TS16FILE.X を活用してください。

再生中はバッファにデータが展開されるたびに `>` が表示されます。最後まで展開が終わると `|` が表示されます。もし再生データの方が進みが速くバッファを消費してしまった場合は `*` が表示されます。バッファアンダーランが発生した場合はメッセージが表示され、再生が一時停止します。`-n` オプションをつけるとプログレス表示を行いません。

---

## MP3データ入手方法

Amazonのダウンロード販売を利用するのが一番手軽です。あるいはPC上でCDリッピングしたデータを何らかのエンコーダソフトを使って作成することもできます。

例: Apple Music を使い、CDから apple lossless 形式 (.m4a) でリッピングしたデータを ffmpeg を使ってタグ情報を含めて固定320kbpsで変換

        ffmpeg hogehoge.m4a -ab 320k -id3v2_version 3 hogehoge.mp3

例: 既存のMP3ファイルのアートワーク画像を差し替える

        ffmpeg -i hoge.mp3 -i hoge.jpg -map 0:a -map 1:v -c copy -disposition:1 attached_pic -id3v2_version 3 hoge_art.mp3

---

## ライセンス

本ソフトはMP3データのデコードに libmad ライブラリ(GPLライセンス)を使用しているためGPLとなります。

ソースコードは https://github.com/tantanGH/hmp3p-src/ に置いてあります。

---

## History

* 0.7.0 (2026/03/11) ... 少し高速化し68060版は44.1kHzVBRデータの内蔵ADPCM再生が追いつくようになった
* 0.6.0 (2026/03/08) ... 680x0汎用バイナリ/68030以上専用バイナリ/68060専用バイナリの3つを同梱
* 0.3.0 (2025/09/15) ... 000/030共通バイナリHMP3P.Xと030専用バイナリHMP3P030.Xの二つを同梱
* 0.2.7 (2024/03/15) ... アボート時にPCM8Aの再生が停止できていなかったのを修正
* 0.2.6 (2024/03/08) ... チェーンテーブルの最後のメモリブロックの開放に失敗することがあったのを修正
* 0.2.5 (2024/03/03) ... デフォルトのバッファ数を6から4に変更。プログレスバー非表示オプション追加
* 0.2.4 (2024/03/02) ... アルバムアートワーク表示に対応した
* 0.2.3 (2024/03/01) ... PCM8PPの代わりにPCM8Aを使うことで内蔵ADPCMでの再生に対応した
* 0.2.2 (2024/03/01) ... 16MB超のMP3ファイルの読み込みが正しくできていなかったのを修正
* 0.2.1 (2024/02/29) ... 48.0kHzのデータ再生に対応した
* 0.2.0 (2024/02/29) ... 初版
