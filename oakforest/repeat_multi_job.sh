for i in 1 600
 do
 export ARG1=$i
 pjsub all_multi_job.sh
 done
