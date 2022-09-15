ORIGINAL_TEMPORARY_PATH="/home/andre/Documentos/ufsc/tcc/examples/Bikes/"
CONVERTED_PGX_PATH="/home/andre/Documentos/ufsc/tcc/examples/pgx/"
JPLM_BINS="jplm/bin"

for i in ${ORIGINAL_TEMPORARY_PATH}/*;  
do  
  ${JPLM_BINS}/utils/convert_ppm_to_pgx -i $i -o ${CONVERTED_PGX_PATH};  
done  
