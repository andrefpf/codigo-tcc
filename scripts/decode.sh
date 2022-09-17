JPLM_BINS="jplm/bin"  
INPUT_JPL_FILE="examples/bikes.jpl"
PGX_PATH="examples/tmp/pgx/"
DECODED_PATH="examples/decoded/Bikes/"

mkdir -p ${PGX_PATH} ${DECODED_PATH}

${JPLM_BINS}/jpl-decoder-bin --show-progress-bar --show-runtime-statistics \
    --input ${INPUT_JPL_FILE} --output ${PGX_PATH} 

# ${JPLM_BINS}/utils/convert_pgx_to_ppm --input ${PGX_PATH} --output ${DECODED_PATH} -ve
