DIR="${1}"
for pathfile in $DIR/2*; do

RECORD_DIR="$pathfile/record/"
WEIGHT_DIR="$pathfile/weight/"
SPIKE_DIR="$pathfile/spike/"
PREFIX=`echo ${pathfile} | rev | cut -c 1-7 | rev`
echo ${PREFIX}
echo "${RECORD_DIR}/${PREFIX}200002Volt.txt"
python ./analyze/drawGraph.py "${RECORD_DIR}/${PREFIX}200002Volt.txt"
echo "${RECORD_DIR}/${PREFIX}300000Volt.txt"
python ./analyze/drawGraph.py "${RECORD_DIR}/${PREFIX}300000Volt.txt"
echo "${WEIGHT_DIR}/${PREFIX}L000weight.lweight"
python ./analyze/weightDraw.py "${WEIGHT_DIR}/${PREFIX}L000weight.lweight"
echo "SPIKE_DIR : ${SPIKE_DIR}"
python ./analyze/drawPSTH.py ${SPIKE_DIR}
python ./analyze/changeSum.py "${WEIGHT_DIR}"

python ~/upload_slack.py "${pathfile}/NRNOPT.param"
python ~/upload_slack.py "${WEIGHT_DIR}/LtoPchangeSum.txt"
python ~/upload_slack.py "${RECORD_DIR}/${PREFIX}200002Volt.png"
python ~/upload_slack.py "${RECORD_DIR}/${PREFIX}300000Volt.png"
python ~/upload_slack.py "${WEIGHT_DIR}/${PREFIX}02weight.png"
python ~/upload_slack.py "${SPIKE_DIR}/${PREFIX}200002_PSTH.png"
python ~/upload_slack.py "${SPIKE_DIR}/${PREFIX}300000_PSTH.png"
done
