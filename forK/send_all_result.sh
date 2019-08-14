source activate py27

DIR="${1}"
for pathfile in $DIR/8*; do

RECORD_DIR="$pathfile/record/"
WEIGHT_DIR="$pathfile/weight/"
SPIKE_DIR="$pathfile/spike/"
echo "RECORD_DIR : ${RECORD_DIR}"
python ./analyze/drawGraph.py "${RECORD_DIR}/200000Volt.txt"
echo "WEIGHT_DIR : ${WEIGHT_DIR}"
python ./analyze/weightDraw.py "${WEIGHT_DIR}/L000weight.lweight"
echo "SPIKE_DIR : ${SPIKE_DIR}"
python ./analyze/drawPSTH.py ${SPIKE_DIR}
python ./analyze/changeSum.py "${WEIGHT_DIR}"

python ~/upload_slack.py "$pathfile/diff.param"
python ~/upload_slack.py "${WEIGHT_DIR}/LtoPchangeSum.txt"
python ~/upload_slack.py "${RECORD_DIR}/200000Volt.png"
python ~/upload_slack.py "${WEIGHT_DIR}/L000weight.png"
python ~/upload_slack.py "${SPIKE_DIR}/200000_PSTH.png"

done