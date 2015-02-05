#!/bin/bash
#$ -cwd
#$ -S /bin/bash
SAMPLE_BARCODE=$1
java -Xmx2G -jar /pod/podstore/software/picard-tools-1.104/AddOrReplaceReadGroups.jar INPUT=${SAMPLE_BARCODE}_outdir/alignments.bam OUTPUT=${SAMPLE_BARCODE}_outdir/rg_alignments.bam RGSM=$SAMPLE_BARCODE RGID=$SAMPLE_BARCODE RGLB=TruSeq RGPL=illumina RGPU=barcode VALIDATION_STRINGENCY=SILENT TMP_DIR=${SAMPLE_BARCODE}_outdir/add_rg_tag_tmp > ${SAMPLE_BARCODE}_outdir/add_rg_tag.log 2> ${SAMPLE_BARCODE}_outdir/add_rg_tag.log
