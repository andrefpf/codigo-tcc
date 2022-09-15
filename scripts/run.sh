CONVERTED_PGX_PATH="/home/andre/Documentos/ufsc/tcc/examples/pgx/"
JPLM_BINS="jplm/bin"
OUTPUT_JPL_FILE=/home/andre/Documentos/ufsc/tcc/bikes.jpl

${JPLM_BINS}/jpl-encoder-bin --show-progress-bar --show-runtime-statistics --part 2  \
    --type 0 --enum-cs YCbCr_2 -u 625 -v 434 -t 13 -s 13 -nc 3 --show-error-estimate \
    --border_policy 1 --lambda 10000 --transform_size_maximum_inter_view_vertical 13 \
    --transform_size_maximum_inter_view_horizontal 13                                \
    --transform_size_maximum_intra_view_vertical 31                                  \
    --transform_size_maximum_intra_view_horizontal 31                                \
    --transform_size_minimum_inter_view_vertical 13                                  \
    --transform_size_minimum_inter_view_horizontal 13                                \
    --transform_size_minimum_intra_view_vertical 4                                   \
    --transform_size_minimum_intra_view_horizontal 4                                 \
    --input ${CONVERTED_PGX_PATH} --output ${OUTPUT_JPL_FILE}
