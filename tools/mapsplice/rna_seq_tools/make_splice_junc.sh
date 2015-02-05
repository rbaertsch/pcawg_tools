#!/bin/bash
export input_bam=$1
export output_bam=$2

UBU_PATH=/pod/podstore/software/rna_seq_tools
dir=`dirname ${input_bam}`
echo "dir is " $dir

echo "java -Xmx512M -jar $UBU_PATH/ubu-1.2-jar-with-dependencies.jar sam-junc "\
    --in ${input_bam} \
    --junctions ${dir}/junctions.txt \
    --out ${output_bam}
java -Xmx512M -jar $UBU_PATH/ubu-1.2-jar-with-dependencies.jar \
    sam-junc \
    --in ${input_bam} \
    --junctions ${dir}/junctions.txt \
    --out ${output_bam}

