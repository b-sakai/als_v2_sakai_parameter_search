for i in 1.1 1.2 1.31 1.315 1.4 1.5 3.0
 do
 export ARG1=$i
 pjsub multi_job.sh
 done
