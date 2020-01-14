#!/bin/bash -x
#PJM --rsc-list "node=7"
#PJM --rsc-list "elapse=3:30:00"
#PJM --rsc-list "rscgrp=regular-cache"
#PJM --mpi "proc=56"
#PJM -s
#PJM -g hp160269
#PJM -x STGIN_LIST=/work/hp160269/m49005/als_v2_sakai_parameter_search/oakforest/stgin.txt
#PJM -x STGOUT_LIST=/work/hp160269/m49005/als_v2_sakai_parameter_search/oakforest/stgout.txt


#--#export OMP_NUM_THREADS=8

NRNIV="/work/hp160269/m49005/neuron_kplus/specials/x86_64/special -mpi"
HOC_NAME="/work/hp160269/m49005/als_v2_sakai_parameter_search/src/wmain.hoc"
#NRNOPT=""
NRNOPT=\
" -c STOPTIME=10"\
" -c IS_SUPERCOMPUTER=1"\
" -c INTERVAL=1000"\
" -c SAVE_ALL=0"\
" -c NCELL=46"\
" -c WEIGHT_200=0.02"\
" -c WEIGHT_300=0.06"\
" -c WEIGHT_301=0.06"\
" -c WEIGHT_M=0.0"\
" -c WEIGHT_GO_300=0.0"\
" -c WEIGHT_GO_301=0.0"\
" -c COMP_0=65"\
" -c COMP_1=5737"\
" -c COMP_2=5025"\
" -c COMP_3=9743"\
" -c GABAA_ON=1"\
" -c GABAB_ON=1"\
" -c DOSE=3000"\
" -c NSTIM=1"\
" -c MECHANO_SPONTANEOUS=10"\
" -c MECHANO_ON=0"\
" -c GENERAL_ODOR_ON=0"\
" -c GABAA_GMAX_LTOP=0.75"\
" -c GABAA_GMAX_LTOL=0.001"\
" -c GABAB_GMAX_LTOP=0.001"\
" -c GABAB_GMAX_LTOL=0.0"\
" -c GBAR_TIMES_LN=1.0"\
" -c GBAR_TIMES_PN=1.0"\
" -c LEARNING=1"

MPIEXEC="mpiexec"
PROF=""

echo "${PROF} ${MPIEXEC} ${NRNIV} ${NRNOPT} ${HOC_NAME}"
time ${PROF} ${MPIEXEC} ${NRNIV} ${NRNOPT} ${HOC_NAME}
echo ${NRNOPT} | tee "NRNOPT.param"

sync
