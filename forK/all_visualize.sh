source activate py27
RECORD_DIR="${1}/record"
WEIGHT_DIR="${1}/weight"
SPIKE_DIR="${1}/spike"
echo "RECORD_DIR : ${RECORD_DIR}"
python ./analyze/drawGraph.py ${RECORD_DIR}
python ./analyze/weightDraw.py ${WEIGHT_DIR}
python ./analyze/drawPSTH.py ${SPIKE_DIR}
