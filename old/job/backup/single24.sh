#!/bin/bash -x
#PJM --rsc-list "node=24"
#PJM --rsc-list "elapse=0:40:00"
#PJM --rsc-list "rscgrp=small"
#PJM --mpi "proc=192"
#PJM -s

# staging
#PJM --stg-transfiles all
#PJM --mpi "use-rankdir"

# CHANGE TO YOUR OWN DIR
#PJM --stgin-basedir /home/hp120263/k01793/code/al_V2/

#PJM --stgin "rank=* ./input/* %r:../input/"
#--#PJM --stgin "rank=* ./input/spiketiming/40stim/* %r:../input/spiketiming/40stim/"
#PJM --stgin "rank=* ./input/spiketiming/1000dose_30stims_filtering/* %r:../input/spiketiming/1000dose_30stims_filtering/"
#PJM --stgin "rank=* ./input/spiketiming/100dose_30stims_filtering/* %r:../input/spiketiming/100dose_30stims_filtering/"
#PJM --stgin "rank=* ./input/spiketiming/10dose_30stims_filtering/* %r:../input/spiketiming/10dose_30stims_filtering/"
#PJM --stgin "rank=* ./src/* %r:./"
#PJM --stgin "rank=* ./single-src/* %r:./"
#--#PJM --stgin "rank=* ../../github/neuron_kplus/stgin/* %r:./"
#--#PJM --stgin "rank=* ../../github/neuron_kplus/specials/sparc64/special %r:./"
#PJM --stgin "rank=* ../../github/neuron_kplus_tune/stgin/* %r:./"
#PJM --stgin "rank=* ../../github/neuron_kplus_tune/specials/sparc64/special %r:./"

#PJM --stgout "rank=* %r:./*.txt /data/hp120263/park/al_V2/%j/record/"
#PJM --stgout "rank=* %r:./*.dat /data/hp120263/park/al_V2/%j/spike/"
#PJM --stgout "rank=* %r:./pd/* /data/hp120263/park/al_V2/%j/pd/"

# SET UP ENVIRONMENT OF LANGUAGE 
. /work/system/Env_base

#--#export OMP_NUM_THREADS=8

#NRNIV="./special -mpi --version"
NRNIV="./special -mpi"
HOC_NAME="./main.hoc"
#NRNOPT=""
NRNOPT=\
" -c STOPTIME=36010"\
" -c IS_SUPERCOMPUTER=1"\
" -c START_TIME=0"\
" -c GABAB_ON=1"\
" -c GABAA_ON=1"\
" -c PTOL_ON=1"\
" -c NSYNAPSE=100"\
" -c NPN=50"\
" -c NLN=350"\
" -c NRN=2000"\
" -c WEIGHT_RNtoPN=0.04"\
" -c WEIGHT_RNtoLN=0.018"\
" -c GABAA_LTOP=0.50"\
" -c GABAA_LTOL=0.50"\
" -c GABAB_LTOP=12.50"\
" -c GABAB_LTOL=0.00"\
" -c DOSE=1000"\
" -c NSTIM=30"\
" -c PROB_LTOP=0.5"\
" -c PROB_LTOL=1.0"\
" -c PROB_PTOL=0.5"\
" -c WEIGHT_PTOL=0.036"\
" -c RND_SEED=0"

LPG="lpgparm -t 4MB -s 4MB -d 4MB -h 4MB -p 4MB"
MPIEXEC="mpiexec -mca mpi_print_stats 1"
#MPIEXEC="mpiexec -mca mpi_print_stats 2 -mca mpi_print_stats_ranks 0"

#PROF="fapp -C -d ./pd -L1 -Hevent=Statistics"
#PROF="fipp -C -Ihwm,call -d ./prof"
#PROF="fipp -C -Ihwm,call -d pd"
#PROF="fipp -C -Ihwm,call -Puserfunc -i 20 -d ./pd"
PROF=""

echo "${PROF} ${MPIEXEC} ${LPG} ${NRNIV} ${NRNOPT} ${HOC_NAME}"
time ${PROF} ${MPIEXEC} ${LPG} ${NRNIV} ${NRNOPT} ${HOC_NAME}

sync
