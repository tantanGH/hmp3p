# HMP3P.X

A simple high memory MP3 player for Human68k/X680x0 + Mercury-UNIT

---

## About This

PhantomX 68030モード + ハイメモリ 専用のMP3音楽プレーヤです。

320kbps(上限)のMP3データや、VBR(Variable Bit Rate)のMP3データを Mercury-UNITを使って 44.1kHz 16bit ステレオ PCM で再生可能です。アルバムアートワークおよびID3タグの表示に対応しています。

Mercury-UNITが無い場合は内蔵ADPCMでも再生できます。

セレクタ[MP3SEL.X](https://github.com/tantanGH/mp3sel/)と組み合わせての利用をおすすめします。

---

## 動作環境 (実機)

* X68000実機
* PhantomX version 1.04b または 1.20
* Raspberry Pi 4B (なるべく後期型)
* MPU 68030 モード (68000モードでは動作しません)
* MPU ライトバックモード (ライトスルーモードでは処理が追いつきません)
* ハイメモリ256MB以上
* Mercury-UNIT V2.0/V3.0/V3.1/V3.5/V4.0 または KeplerX
* [TS16DRVp.X ハイメモリドライバ](https://hauoli.x68kbbs.com/)
* [PCM8PP.X 0.83d](http://retropc.net/x68000/software/hardware/mercury/pcm8pp/)
* Mercury-UNITが無い場合は [PCM8A.X 1.02.1 (TcbnErik氏のハイメモリ対応版)](https://github.com/kg68k/pcm8a/releases/tag/v1.02.1)

MP3データファイルは PhantomX 1.04 の WindrvXM 機能を利用してSDカードに直接保存することを強くお勧めします。

68040モードでも動作しますが、68040に対応したFLOATの組み込みが必要です。FLOAT2.Xを使うか、68040対応改造版のFLOAT4を利用してください。SHARP純正FLOAT3.X/FLOAT4.Xは68040に対応していません。なお、MP3のデコードはすべて整数演算によるものです。FLOATはXCのライブラリが一部使います。

PhantomXのバージョンは人柱版を使ってください。

---

## 動作環境 (エミュレータ)

XEiJ でのみ確認しています。

* XEiJ X68030 モード
* 060turbo互換ハイメモリ 256MB以上
* TS16DRVp.X ハイメモリドライバ
* MPUクロック 250MHz 以上
* ウェイトサイクルあり可
* PCM8A.X 1.02.1
* データはHFSから読むこと

---

## 使い方

TS16DRVp.X および PCM8PP.X をあらかじめ常駐させておきます。Mercury-UNITが無い場合は PCM8PP.X の代わりに PCM8A.X を使用してください。

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

WindrvXM/VDISKドライブ以外のSCSIドライブ等からMP3を読み込む場合は `-s` オプションをつけてください。
TS16FILE.X は WindrvXM + ハイメモリと相性が悪いので使わないようにしてください。

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

* 0.2.7 (2024/03/15) ... アボート時にPCM8Aの再生が停止できていなかったのを修正
* 0.2.6 (2024/03/08) ... チェーンテーブルの最後のメモリブロックの開放に失敗することがあったのを修正
* 0.2.5 (2024/03/03) ... デフォルトのバッファ数を6から4に変更。プログレスバー非表示オプション追加
* 0.2.4 (2024/03/02) ... アルバムアートワーク表示に対応した
* 0.2.3 (2024/03/01) ... PCM8PPの代わりにPCM8Aを使うことで内蔵ADPCMでの再生に対応した
* 0.2.2 (2024/03/01) ... 16MB超のMP3ファイルの読み込みが正しくできていなかったのを修正
* 0.2.1 (2024/02/29) ... 48.0kHzのデータ再生に対応した
* 0.2.0 (2024/02/29) ... 初版
