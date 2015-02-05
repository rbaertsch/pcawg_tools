#!/bin/bash

PATH=$PATH:/pod/podstore/bin
SAMPLE_NAME_OUTDIR=$1
SAMPLE_NAME=$2


samtools view -f 2 -b /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/rg_alignments_sorted.bam | samtools rmdup - /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/$SAMPLE_NAME.sorted.rmdup.bam

#samtools view -f 2 -b $SORTED_BAM | samtools rmdup - $OUT_DIR/$SAMPLE_NAME.sorted.rmdup.bam
