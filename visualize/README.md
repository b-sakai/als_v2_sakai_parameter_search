## 動画化手順

### 事前準備
+ pip install swc2vtkでライブラリをインストール

### 実際の手順
#### dat -> vtk
+ SAVE_ALL=1でsimulationを実行し、各時間ごとの全コンパートメントの電位を保存したファイル群を結果として得る（datファイル）
+ visualize_in_oakforest.pyに入力ディレクトリ（datファイル）と出力ディレクトリ（vtkファイル）を指定
　他に時間の指定なども可能
+ python visualize_in_oakforest.pyで出力ディレクトリでvtkファイルを作成

#### vtk -> jpeg
+ paraviewをGUIで実行可能な環境にscp, rsyncなどを用いて移動
+ paraviewを立ち上げ（Paraviw-.../bin/paraview)、File->openでvtkファイルを開く
+ はじめはdataと出ているのでsimulationに変える（dataはコンパートメント番号）
+ color map editorを開きMapping Dataの右にあるrescale to custom rangeボタン（文字でなく記号になっている）を押して、
　"-60 ~ +20"のように適正な範囲に固定する
+ File->save Animationでファイル名、出力ディレクトリを指定してjpeg連番ファイルとして出力する。

#### jpeg -> mp4
+ ffmpegなどでjpeg画像からmp4に変換する
```
ffmpeg -i 750.%04d.jpeg -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" mov_750_1000_1100_pn.mp4
ffmpeg -i mov_075_1000_1100_pn.mp4 -vf setpts=PTS/5.0 -af atempo=5.0 mov_075_1000_1100_pn_5x.mp4
```
