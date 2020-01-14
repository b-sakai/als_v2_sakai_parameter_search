DIR="${1}"
for pathfile in $DIR/2*; do

RECORD_DIR="$pathfile/record/"
WEIGHT_DIR="$pathfile/weight/"
SPIKE_DIR="$pathfile/spike/"
PREFIX=`echo ${pathfile} | rev | cut -c 1-7 | rev`
echo ${PREFIX}
echo "${WEIGHT_DIR}/${PREFIX}00weight.weight"

python ~/upload_slack.py "${WEIGHT_DIR}/${PREFIX}00weight.png"
done
