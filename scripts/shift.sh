ORIGINALS_INPUT_PATH="/home/andre/Documentos/ufsc/tcc/examples/Bikes/"
ORIGINAL_TEMPORARY_PATH="/home/andre/Documentos/ufsc/tcc/examples/shifted/"  
JPLM_BINS="jplm/bin"  

${JPLM_BINS}/utils/lenslet_13x13_shifter -i ${ORIGINALS_INPUT_PATH} -o ${ORIGINAL_TEMPORARY_PATH} encoder
