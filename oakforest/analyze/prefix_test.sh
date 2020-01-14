RECORD_DIR="${1}/record/"
WEIGHT_DIR="${1}/weight/"
SPIKE_DIR="${1}/spike/"
prefix=`echo ${1} | rev | cut -c 2-8 | rev`
echo ${prefix}
volt_file="${prefix}200000Volt.txt"
echo ${volt_file}
