source activate py27
RECORD_DIR="${1}/record/200000Volt.txt"
WEIGHT_DIR="${1}/weight/L000weightL.weight"
SPIKE_DIR="${1}/spike/" #200000Spike.dat"
echo "RECORD_DIR : ${RECORD_DIR}"
python ./analyze/drawGraph.py ${RECORD_DIR}
echo "WEIGHT_DIR : ${WEIGHT_DIR}"
python ./analyze/weightDraw.py ${WEIGHT_DIR}
echo "SPIKE_DIR : ${SPIKE_DIR}"
python ./analyze/drawPSTH.py ${SPIKE_DIR}


