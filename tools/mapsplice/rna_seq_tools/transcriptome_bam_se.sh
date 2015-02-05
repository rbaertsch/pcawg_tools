#!/bin/bash
#$ -cwd
#$ -S /bin/bash
export input_bam=$1
export transcript_bed=$2
export transcript_bam=$3
export transcript_fasta=$4
UBU_PATH=/pod/podstore/software/rna_seq_tools

java -Xms3G -Xmx3G -jar $UBU_PATH/ubu-1.2-jar-with-dependencies.jar \
    sam-xlate \
        --bed ${transcript_bed} \
        --in ${input_bam} \
        --out ${transcript_bam} \
        --order ${transcript_fasta} \
        --xgtags --reverse --single
export pid=$$
echo "${transcript_bam} size `ls -l ${transcript_bam}` in `pwd` " > temp.$pid.txt
mailx -s "${transcript_bam} done" baertsch@soe.ucsc.edu < temp.$pid.txt
rm -f temp.$pid.txt
