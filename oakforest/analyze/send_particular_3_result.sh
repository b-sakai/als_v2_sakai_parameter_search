DIR="${1}"
for pathfile in $DIR/2*; do

RECORD_DIR="$pathfile/record/"
WEIGHT_DIR="$pathfile/weight/"
SPIKE_DIR="$pathfile/spike/"
PREFIX=`echo ${pathfile} | rev | cut -c 1-7 | rev`
echo ${PREFIX}
echo "${WEIGHT_DIR}/${PREFIX}01weight.weight"
python ./analyze/weightDraw.py "${WEIGHT_DIR}/${PREFIX}01weight.rweight"

python ~/upload_slack.py "${WEIGHT_DIR}/${PREFIX}00weight.png"
python ~/upload_slack.py "${WEIGHT_DIR}/${PREFIX}01weight.png"
python ~/upload_slack.py "${WEIGHT_DIR}/${PREFIX}02weight.png"
python ~/upload_slack.py "${WEIGHT_DIR}/${PREFIX}03weight.png"
python ~/upload_slack.py "${WEIGHT_DIR}/${PREFIX}04weight.png"
python ~/upload_slack.py "${WEIGHT_DIR}/${PREFIX}05weight.png"
python ~/upload_slack.py "${WEIGHT_DIR}/${PREFIX}06weight.png"
python ~/upload_slack.py "${WEIGHT_DIR}/${PREFIX}07weight.png"
python ~/upload_slack.py "${WEIGHT_DIR}/${PREFIX}08weight.png"
python ~/upload_slack.py "${WEIGHT_DIR}/${PREFIX}09weight.png"
python ~/upload_slack.py "${WEIGHT_DIR}/${PREFIX}10weight.png"
done
