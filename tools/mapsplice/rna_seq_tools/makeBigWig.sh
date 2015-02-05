#
INPUT=$1
DB=$2
SIZE=$3
NAME=${INPUT%%.bed}
BIN=/pod/podstore/bin/
$BIN/bedtools bamtobed -i $INPUT > ${NAME}.bed
$BIN/bedItemOverlapCount -chromSize=$SIZE $DB ${NAME}.bed > ${NAME}.bedGraph
$BIN/bedGraphToBigWig ${NAME}.bedGraph $SIZE ${NAME}.bw
