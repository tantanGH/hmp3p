# HMP3P.X

A simple high memory MP3 player for Human68k/X680x0 + Mercury-UNIT

---

## About This

PhantomX ハイメモリ + Mercury-UNIT 専用のMP3音楽プレーヤです。
VBR(Variable Bit Rate)のMP3データを 44.1kHz 16bit ステレオ PCM で再生可能です。

---

## 動作環境

* X68000実機
* PhantomX version 1.04b
* Raspberry Pi 4B (なるべく後期型)
* MPU 68030 モード (68000モードでは動作しません)
* MPU ライトバックモード (ライトスルーモードでは処理が追いつきません)
* Mercury-UNIT V2.0/V3.0/V3.1/V3.5/V4.0 (KeplerXは未確認)
* ハイメモリ256MB以上
* TS16DRVp.X ハイメモリドライバ
* PCM8PP.X 0.83d

MP3データファイルは PhantomX 1.04 の WindrvXM 機能を利用してSDカードに直接保存することを強くお勧めします。

68040モードでも動作しますが、68040に対応したFLOATの組み込みが必要です。FLOAT2.Xを使うか、68040対応改造版のFLOAT4を利用してください。SHARP純正FLOAT3.X/FLOAT4.Xは68040に対応していません。

---

## 使い方

PCM8PP.X をあらかじめ常駐させておきます。

        usage: hmp3p [options] <input-file.mp3>
        options:
             -v[n] ... volume (1-15, default:6)
             -l[n] ... loop count (none:endless, default:1)
             -q[n] ... mp3 quality (0:high, 1:normal, default:0)
             -b<n> ... buffer size [x 64KB] (3-32,default:6)
             -s    ... use main memory for file reading (SCSI disk)
             -h    ... show help message

音割れを防ぐために、PCM8PPの音量設定は少し小さめとなっています。

-q1 でハーフレート再生となり処理負担が減りますが、Mercury-UNIT V3.5以上が必須となります。

WindrvXM/VDISKドライブ以外のSCSIドライブ等からMP3を読み込む場合は -s オプションをつけるか TS16FILE.X を常駐させておいてください。

再生中はバッファにデータが展開されるたびに > が表示されます。最後まで展開が終わると | が表示されます。もし再生データの方が進みが速くバッファを消費してしまった場合は * が表示されます。バッファアンダーランが発生した場合はメッセージが表示され、再生が一時停止します。

---

## MP3データ入手方法

Amazonのダウンロード販売を利用するのが一番手軽です。あるいはPC上でCDリッピングしたデータを何らかのエンコーダソフトを使って作成することもできます。

---

## ライセンス

本ソフトはMP3データのデコードに libmad ライブラリ(GPLライセンス)を使用しているためGPLとなります。

ソースコードは https://github.com/tantanGH/hmp3p-src/ に置いてあります。

---

## History

* 0.2.1 (2024/02/29) ... 48.0kHzのデータ再生に対応した
* 0.2.0 (2024/02/29) ... 初版
