for i in 0.0 30000.0
 do
 export ARG1=$i
 pjsub multi_job.sh
 done
