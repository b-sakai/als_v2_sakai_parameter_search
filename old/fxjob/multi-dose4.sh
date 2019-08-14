#!/bin/bash -x
#PJM --rsc-list "node=4"
#PJM --rsc-list "elapse=2:00:00"
#PJM --rsc-list "rscgrp=fx-small"
#PJM --mpi "proc=128"
#PJM -s

# staging
#PJM --stg-transfiles all
#PJM --mpi "use-rankdir"

#-------------------------------------------------------------------------------------
# CHANGE TO YOUR OWN DIR
#PJM --stgin-basedir /home/hp120263/k01793/code/al_V2/

#-------------------------------------------------------------------------------------
# STAGE IN ANTENNAL LOBE SIMULATION PROGRAM
#PJM --stgin "rank=* ./input/* %r:../input/"
#--#PJM --stgin "rank=* ./input/spiketiming/40stim/* %r:../input/spiketiming/40stim/"
#PJM --stgin "rank=* ./input/spiketiming/1000dose_30stims_filtering/* %r:../input/spiketiming/1000dose_30stims_filtering/"
#PJM --stgin "rank=* ./input/spiketiming/1000dose_30stims_filtering/* %r:../input/spiketiming/1000dose_30stims_filtering_adaptation/"
#PJM --stgin "rank=* ./input/spiketiming/100dose_30stims_filtering/* %r:../input/spiketiming/100dose_30stims_filtering/"
#PJM --stgin "rank=* ./input/spiketiming/10dose_30stims_filtering/* %r:../input/spiketiming/10dose_30stims_filtering/"
#PJM --stgin "rank=* ./src/* %r:./"
#PJM --stgin "rank=* ./single-src/* %r:./"

#-------------------------------------------------------------------------------------
# STAGE IN NEURON_KPLUS SIMULATOR
#--#PJM --stgin "rank=* ../../github/neuron_kplus/stgin/* %r:./"
#--#PJM --stgin "rank=* ../../github/neuron_kplus/specials/sparc64/special %r:./"
#--#PJM --stgin "rank=* ../../github/neuron_kplus_tune/stgin/* %r:./"
#--#PJM --stgin "rank=* ../../github/neuron_kplus_tune/specials/sparc64/special %r:./"

#PJM --stgin "rank=* ../../github/neuron_kplus73/stgin/* %r:./"
#PJM --stgin "rank=* ../../github/neuron_kplus73/specials/sparc64/special %r:./"

#-------------------------------------------------------------------------------------
# STAGE OUT TO DATA DIRECTORY
#PJM --stgout "rank=* %r:./*.txt /data/hp120263/park/al_V2/%j/record/"
#PJM --stgout "rank=* %r:./*.dat /data/hp120263/park/al_V2/%j/spike/"
#PJM --stgout "rank=* %r:./pd/* /data/hp120263/park/al_V2/%j/pd/"

# SET UP ENVIRONMENT OF LANGUAGE 
. /work/system/Env_base

#--#export OMP_NUM_THREADS=8

RESULT_DIR="../fx-result/"
RECORD_DIR10="${RESULT_DIR}${PJM_JOBID}/record/10/"
RECORD_DIR100="${RESULT_DIR}${PJM_JOBID}/record/100/"
RECORD_DIR1000="${RESULT_DIR}${PJM_JOBID}/record/1000/"
SPIKE_DIR10="${RESULT_DIR}${PJM_JOBID}/spike/10/"
SPIKE_DIR100="${RESULT_DIR}${PJM_JOBID}/spike/100/"
SPIKE_DIR1000="${RESULT_DIR}${PJM_JOBID}/spike/1000/"

OUT="${RESULT_DIR}${PJM_JOBID}/out"
#SPIKERECORD_DIR="${BASE_DIR}${Time}/spike"
mkdir -p ${RECORD_DIR10}
mkdir -p ${RECORD_DIR100}
mkdir -p ${RECORD_DIR1000}
mkdir -p ${SPIKE_DIR10}
mkdir -p ${SPIKE_DIR100}
mkdir -p ${SPIKE_DIR1000}

#NRNIV="./special -mpi --version"
#NRNIV="./special -mpi"
#NRNIV="./special -mpi"
NRNIV="/home/usr7/z48927t/github/neuron_kplus/specials/sparc64/special -mpi"
HOC_NAME="./main.hoc"
#NRNOPT=""

NRNOPT=\
" -c JOBID=${PJM_JOBID}"\
" -c STOPTIME=6000"\
" -c IS_SUPERCOMPUTER=2"\
" -c START_TIME=0"\
" -c GABAB_ON=0"\
" -c GABAA_ON=0"\
" -c PTOL_ON=0"\
" -c NSYNAPSE=350"\
" -c NPN=50"\
" -c NLN=350"\
" -c NRN=0"\
" -c GABAA_LTOP=0.0"\
" -c GABAA_LTOL=0.0"\
" -c GABAB_LTOP=0.0"\
" -c GABAB_LTOL=1.5"\
" -c PN_NACH_GMAX=0.7"\
" -c LN_NACH_GMAX=0.1"\
" -c PtoL_NACH_GMAX=0.0"\
" -c DOSE=0"\
" -c NSTIM=30"\
" -c PROB_LTOP=0.5"\
" -c PROB_LTOL=1.0"\
" -c PROB_PTOL=0.5"\
" -c RND_SEED=0"\
" -c RNtoLN_Latency=100"\
" -c VOLTAGERECORD=0"\
" -c CURRENTRECORD=0"

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
