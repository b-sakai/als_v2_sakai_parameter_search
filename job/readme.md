job.sh　
京コンピュータ上で触角葉シミュレーションを動かすためのプログラム
１つのパラメータセットで実行
実行方法：pjsub job.sh

temp_job.sh　
job.shを改変する際に一時的に使用するためのファイル
実行方法：pjsub temp_job.sh

multi_job.sh
環境変数を引数にとって実行
実行方法：export ARG1=variable （適当なパラメータを設定）
          pjsub multi_job.sh

repet_multi_job.sh
環境変数を設定して、multi_job.shを実行
複数のパラメータセットで実行できる。
実行方法：sh repeat_multi_job.sh