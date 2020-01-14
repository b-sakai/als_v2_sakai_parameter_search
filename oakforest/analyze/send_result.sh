RECORD_DIR="${1}/record/"
WEIGHT_DIR="${1}/weight/"
SPIKE_DIR="${1}/spike/"
PREFIX=`echo ${1} | rev | cut -c 2-8 | rev`
echo ${PREFIX}
echo "${RECORD_DIR}/${PREFIX}200000Volt.txt"
python ./analyze/drawGraph.py "${RECORD_DIR}/${PREFIX}200000Volt.txt"
echo "${WEIGHT_DIR}/${PREFIX}L000weight.lweight"
python ./analyze/weightDraw.py "${WEIGHT_DIR}/${PREFIX}L000weight.lweight"
echo "SPIKE_DIR : ${SPIKE_DIR}"
python ./analyze/drawPSTH.py ${SPIKE_DIR}
python ./analyze/changeSum.py "${WEIGHT_DIR}"

python ~/upload_slack.py "${1}/NRNOPT.param"
python ~/upload_slack.py "${WEIGHT_DIR}/LtoPchangeSum.txt"
python ~/upload_slack.py "${RECORD_DIR}/${PREFIX}200000Volt.png"
python ~/upload_slack.py "${WEIGHT_DIR}/${PREFIX}L000weight.png"
python ~/upload_slack.py "${SPIKE_DIR}/${PREFIX}200000_PSTH.png"

