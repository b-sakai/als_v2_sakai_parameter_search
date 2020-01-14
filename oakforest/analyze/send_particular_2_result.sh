DIR="${1}"
for pathfile in $DIR/2*; do

RECORD_DIR="$pathfile/record/"
WEIGHT_DIR="$pathfile/weight/"
SPIKE_DIR="$pathfile/spike/"
PREFIX=`echo ${pathfile} | rev | cut -c 1-7 | rev`
echo ${PREFIX}
echo "${SPIKE_DIR}/${PREFIX}200002_PSTH.png"

python ~/upload_slack.py "${SPIKE_DIR}/${PREFIX}200000_PSTH.png"
python ~/upload_slack.py "${SPIKE_DIR}/${PREFIX}200001_PSTH.png"
python ~/upload_slack.py "${SPIKE_DIR}/${PREFIX}200002_PSTH.png"
python ~/upload_slack.py "${SPIKE_DIR}/${PREFIX}200003_PSTH.png"
python ~/upload_slack.py "${SPIKE_DIR}/${PREFIX}200004_PSTH.png"
python ~/upload_slack.py "${SPIKE_DIR}/${PREFIX}200005_PSTH.png"
python ~/upload_slack.py "${SPIKE_DIR}/${PREFIX}200006_PSTH.png"
python ~/upload_slack.py "${SPIKE_DIR}/${PREFIX}200007_PSTH.png"
python ~/upload_slack.py "${SPIKE_DIR}/${PREFIX}200008_PSTH.png"
python ~/upload_slack.py "${SPIKE_DIR}/${PREFIX}200009_PSTH.png"
python ~/upload_slack.py "${SPIKE_DIR}/${PREFIX}200010_PSTH.png"
done
