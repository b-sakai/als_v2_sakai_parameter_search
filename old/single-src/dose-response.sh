#! /bin/bash

# Make directory to save data file
Time=`date '+%m%d%H%M%S'`
echo "TIME : ${Time}"
RESULT_DIR="../single-result/"
RECORD_DIR="${RESULT_DIR}${Time}/record"
SPIKE_DIR="${RESULT_DIR}${Time}/spike"
OUT="${RESULT_DIR}${Time}/out"
#SPIKERECORD_DIR="${BASE_DIR}${Time}/spike"
echo "DATA DIRECTORY : ${RECORD_DIR}"
mkdir -p ${RECORD_DIR}
mkdir -p ${SPIKE_DIR}

NRNIV="../specials/x86_64/special -mpi"
HOC_NAME="./dose-response.hoc"

NRNOPT=\
" -c STOPTIME=3000"\
" -c IS_SUPERCOMPUTER=0"\
" -c START_TIME=${Time}"\
" -c GABAB_ON=0"\
" -c GABAA_ON=0"\
" -c PTOL_ON=0"\
" -c NSYNAPSE=100"\
" -c NPN=10"\
" -c NLN=0"\
" -c NRN=1000"\
" -c WEIGHT_RNtoPN=0.10"\
" -c WEIGHT_RNtoLN=0.02"\
" -c GABAA_LTOP=5.00"\
" -c GABAA_LTOL=0.10"\
" -c GABAB_LTOP=0.50"\
" -c GABAB_LTOL=0.10"\
" -c DOSE=0"\
" -c NSTIM=1"\
" -c PROB_LTOP=1.0"\
" -c PROB_LTOL=1.0"\
" -c PROB_PTOL=1.0"\
" -c WEIGHT_PTOL=3.0"\
" -c PN_NACH_GMAX=0.10"\
" -c RND_SEED=0"

MPIEXEC="mpiexec -n 8"
EXEC="${MPIEXEC} ${NRNIV} ${NRNOPT} ${HOC_NAME}"

echo $NRNOPT
echo $EXEC
time $EXEC |tee $OUT

python ../src/drawGraph.py $RECORD_DIR
python ./draw_DoseCurve.py $SPIKE_DIR
#python ./draw_FreqCurve.py $SPIKE_DIR
python ./draw_LatencyGraph.py $SPIKE_DIR
