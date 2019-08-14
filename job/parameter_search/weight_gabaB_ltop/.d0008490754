#!/bin/bash -x
#PJM --rsc-list "node=7"
#PJM --rsc-list "elapse=3:30:00"
#PJM --rsc-list "rscgrp=small"
#PJM --mpi "proc=56"
#PJM -s
#PJM -X

# staging
#PJM --stg-transfiles all
#PJM --mpi "use-rankdir"

# CHANGE TO YOUR OWN DIR
#PJM --stgin-basedir /home/hp160269/k04245/als_v2_sakai_parameter_search/

#PJM --stgin "rank=* ./input/* %r:../input/"
#PJM --stgin "rank=* ./input/network_info/* %r:../input/network_info/"
#PJM --stgin "rank=* ./input/spiketiming/* %r:../input/spiketiming/"
#PJM --stgin "rank=* ./input/spiketiming/ORN/* %r:../input/spiketiming/ORN/"
#PJM --stgin "rank=* ./input/spiketiming/ORN/0ng_1stim/* %r:../input/spiketiming/ORN/0ng_1stim/"
#PJM --stgin "rank=* ./input/spiketiming/ORN/1000ng_1stim/* %r:../input/spiketiming/ORN/1000ng_1stim/"
#PJM --stgin "rank=* ./input/spiketiming/ORN/3000ng_1stim/* %r:../input/spiketiming/ORN/3000ng_1stim/"
#PJM --stgin "rank=* ./input/spiketiming/MRN/* %r:../input/spiketiming/MRN/"
#PJM --stgin "rank=* ./input/spiketiming/MRN/10Hz_1stim/* %r:../input/spiketiming/MRN/10Hz_1stim/"
#PJM --stgin "rank=* ./input/spiketiming/MRN/10Hz_constant/* %r:../input/spiketiming/MRN/10Hz_constant/"
#PJM --stgin "rank=* ./input/spiketiming/general_odor/* %r:../input/spiketiming/general_odor/"


#PJM --stgin "rank=* ./input/swc/* %r:../input/swc/"
#PJM --stgin "rank=* ./input/swc/rn0514/* %r:../input/swc/rn0514/"
#PJM --stgin "rank=* ./input/synapse_info/* %r:../input/synapse_info/"
#PJM --stgin "rank=* ./input/synapse_info/46cells_sakai/* %r:../input/synapse_info/46cells_sakai/"
#PJM --stgin "rank=* ./input/synapse_list/* %r:../input/synapse_list/"
#PJM --stgin "rank=* ./input/synapse_list/46cells/* %r:../input/synapse_list/46cells/"
#PJM --stgin "rank=* ./input/synapse_list/fromRN/* %r:../input/synapse_list/fromRN/"
#PJM --stgin "rank=* ./input/synapse_list/fromRN/syn_glomerulars/* %r:../input/synapse_list/fromRN/syn_glomerulars/"
#PJM --stgin "rank=* ./input/synapse_list/fromRN/syn_glomerulars/300/* %r:../input/synapse_list/fromRN/syn_glomerulars/300/"
#PJM --stgin "rank=* ./input/synapse_list/fromRN/syn_glomerulars/301/* %r:../input/synapse_list/fromRN/syn_glomerulars/301/"
#PJM --stgin "rank=* ./input/synapse_list/fromRN/syn_glomerulars/302/* %r:../input/synapse_list/fromRN/syn_glomerulars/302/"
#PJM --stgin "rank=* ./input/synapse_list/fromRN/syn_glomerulars/303/* %r:../input/synapse_list/fromRN/syn_glomerulars/303/"
#PJM --stgin "rank=* ./input/synapse_list/fromMRN/* %r:../input/synapse_list/fromMRN/"

#PJM --stgin "rank=* ./src/* %r:./"

# STAGE IN NEURON_KPLUS SIMULATOR
#PJM --stgin "rank=* ../../k04245/neuron_kplus/stgin/* %r:./"
#PJM --stgin "rank=* ../../k04245/neuron_kplus/specials/sparc64/special %r:./"

#PJM --stgout "rank=* %r:./*.param /data/hp160269/sakai/als_v2_sakai/weight_gabaB_ltop/%j/"
#PJM --stgout "rank=* %r:./*.txt /data/hp160269/sakai/als_v2_sakai/weight_gabaB_ltop/%j/record/"
#PJM --stgout "rank=* %r:./*.lweight /data/hp160269/sakai/als_v2_sakai/weight_gabaB_ltop/%j/weight/"
#PJM --stgout "rank=* %r:./*.rweight /data/hp160269/sakai/als_v2_sakai/weight_gabaB_ltop/%j/weight/"
#PJM --stgout "rank=* %r:./*.dat /data/hp160269/sakai/als_v2_sakai/weight_gabaB_ltop/%j/spike/"

# SET UP ENVIRONMENT OF LANGUAGE 
. /work/system/Env_base

#--#export OMP_NUM_THREADS=8

NRNIV="./special -mpi"
HOC_NAME="./wmain.hoc"
#NRNOPT=""
NRNOPT=\
" -c STOPTIME=3000"\
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
" -c GABAB_GMAX_LTOP=${ARG1}"\
" -c GABAB_GMAX_LTOL=0.0"\
" -c GBAR_TIMES_LN=1.0"\
" -c GBAR_TIMES_PN=1.0"\
" -c LEARNING=1"

MPIEXEC="mpiexec -mca mpi_print_stats 1"
PROF=""

echo "${PROF} ${MPIEXEC} ${NRNIV} ${NRNOPT} ${HOC_NAME}"
time ${PROF} ${MPIEXEC} ${NRNIV} ${NRNOPT} ${HOC_NAME}
echo ${NRNOPT} | tee "NRNOPT.param"
echo "weight_gabaB_ltop : " | tee "diff.param"
echo ${ARG1} | tee -a "diff.param"

sync

