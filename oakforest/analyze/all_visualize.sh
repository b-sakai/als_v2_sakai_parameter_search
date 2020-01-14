DIR="${1}"
for pathfile in $DIR/2*; do

RECORD_DIR="$pathfile/record"
WEIGHT_DIR="$pathfile/weight"
SPIKE_DIR="$pathfile/spike"
echo "RECORD_DIR : ${RECORD_DIR}"
python ./analyze/drawGraph.py ${RECORD_DIR}
python ./analyze/weightDraw.py ${WEIGHT_DIR}
python ./analyze/drawPSTH.py ${SPIKE_DIR}

done
