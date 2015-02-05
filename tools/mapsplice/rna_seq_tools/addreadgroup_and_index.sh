#!/bin/bash
#$ -cwd
#$ -S /bin/bash
PATH=$PATH:/pod/podstore/bin
SAMPLE_BARCODE=$1
export SCRATCH=/scratch/tmp/rg_sort_$$
export T_FILE1=${SCRATCH}/${SAMPLE_BARCODE}.rg_alignments.bam

echo $HOSTNAME $SCRATCH
echo "java -Xmx2G -jar /pod/podstore/software/picard-tools-1.104/AddOrReplaceReadGroups.jar INPUT=${SAMPLE_BARCODE}_outdir/alignments.bam OUTPUT=${T_FILE1} RGSM=$SAMPLE_BARCODE RGID=$SAMPLE_BARCODE RGLB=TruSeq RGPL=illumina RGPU=barcode VALIDATION_STRINGENCY=SILENT TMP_DIR=${SCRATCH}/add_rg_tag_tmp" >> ${SAMPLE_BARCODE}_outdir/add_rg_tag.log 
java -Xmx2G -jar /pod/podstore/software/picard-tools-1.104/AddOrReplaceReadGroups.jar INPUT=${SAMPLE_BARCODE}_outdir/alignments.bam OUTPUT=${T_FILE1} RGSM=$SAMPLE_BARCODE RGID=$SAMPLE_BARCODE RGLB=TruSeq RGPL=illumina RGPU=barcode VALIDATION_STRINGENCY=SILENT TMP_DIR=${SCRATCH}/add_rg_tag_tmp > ${SAMPLE_BARCODE}_outdir/add_rg_tag.log 2> ${SAMPLE_BARCODE}_outdir/add_rg_tag.err
INPUT=$2
DIR=`dirname ${INPUT}`
OUT_FILE=`basename ${INPUT}`
export T_FILE2=${SCRATCH}/${OUT_FILE%%.bam}_sorted 
echo "stderr :" $DIR/sort_index.err
echo "samtools sort ${T_FILE1} ${T_FILE2} ; samtools index ${T_FILE2}.bam " >> $DIR/sort_index.log
samtools sort ${T_FILE1} ${T_FILE2} 2> $DIR/sort_index.err ; samtools index ${T_FILE2}.bam 2>> $DIR/sort_index.err
echo "cp ${T_FILE2}.bam ${DIR}" >> $DIR/sort_index.log
cp ${T_FILE2}.bam ${DIR}
echo "cp ${T_FILE2}.bam.bai ${DIR}" >> $DIR/sort_index.log
cp ${T_FILE2}.bam.bai ${DIR}
