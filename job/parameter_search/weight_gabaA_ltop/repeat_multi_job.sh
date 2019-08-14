for i in 0.0 200.0 2000.0 20000.0
 do
 export ARG1=$i
 pjsub multi_job.sh
 done