for i in 0.00 0.3 3.0 30.0 300.0
 do
 export ARG1=$i
 pjsub multi_job.sh
 done