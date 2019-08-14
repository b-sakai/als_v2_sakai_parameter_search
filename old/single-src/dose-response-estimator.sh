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

NRNIV="/work/github/neuron_kplus/specials/x86_64/special -mpi"
#HOC_NAME="./dose-response-estimator0109commit.hoc"
#HOC_NAME="./dose-response-estimator.hoc"
HOC_NAME="./dose-response-estimator-check.hoc"
#HOC_NAME="./dose-response-estimator-oldRNmodel.hoc"

NRNOPT=\
" -c STOPTIME=1000"\
" -c IS_SUPERCOMPUTER=0"\
" -c START_TIME=${Time}"\
" -c NCELL=10"\
" -c NRN=350"\
" -c CELL_TYPE=1"\
" -c WEIGHT_RNtoPN=0.50"\
" -c WEIGHT_RNtoLN=0.02"\
" -c PN_NACH_GMAX=0.7"\
" -c RND_SEED=0"\
" -c ESTIMATION=0" #ESTIMATION 1 for CMA-ES on Super Computer 
#MPIEXEC="mpiexec -n 8"
MPIEXEC=""
EXEC="${MPIEXEC} ${NRNIV} ${NRNOPT} ${HOC_NAME}"

echo $NRNOPT
echo $EXEC
time $EXEC |tee $OUT

#python ../src/drawGraph.py $RECORD_DIR
#python ./butterworth.py $RECORD_DIR
#python ./NetCon_PSTH.py $SPIKE_DIR
##python ../src/drawISF.py $SPIKE_DIR
#python ../src/spike_analyze.py $SPIKE_DIR
##python ../src/whole_in_one_spike.py $SPIKE_DIR
#python ./draw_DoseCurve.py $SPIKE_DIR
##python ./draw_FreqCurve.py $SPIKE_DIR
