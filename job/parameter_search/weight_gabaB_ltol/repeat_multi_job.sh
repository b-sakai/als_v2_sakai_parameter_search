for i in 0.0 0.3 3.0 300.0 30000.0
 do
 export ARG1=$i
 pjsub multi_job.sh
 done