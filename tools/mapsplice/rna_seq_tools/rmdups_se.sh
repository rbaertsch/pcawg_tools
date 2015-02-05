#!/bin/bash
#$ -cwd
#$ -S /bin/bash

PATH=$PATH:/pod/podstore/bin
INPUT=$1
OUTDIR=`dirname $INPUT`
SAMPLE_NAME=$2

echo "samtools view -b $INPUT pipeTo samtools rmdup - $OUTDIR/$SAMPLE_NAME.sorted.rmdup.bam"
samtools view -b $INPUT | samtools rmdup - $OUTDIR/$SAMPLE_NAME.sorted.rmdup.bam
samtools index $OUTDIR/$SAMPLE_NAME.sorted.rmdup.bam 2>> $OUTDIR/$SAMPLE_NAME.sort_index.err
