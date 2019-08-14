for i in 0 1
 do
 export ARG1=$i
 pjsub multi_job.sh
 done