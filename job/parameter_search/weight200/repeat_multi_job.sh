for i in 0.0007 0.0008 0.0009 0.001 0.0011 0.0012 0.0013 0.0013 0.0015 0.0016 0.0017 0.0018 0.0019
 do
 export ARG1=$i
 pjsub multi_job.sh
 done