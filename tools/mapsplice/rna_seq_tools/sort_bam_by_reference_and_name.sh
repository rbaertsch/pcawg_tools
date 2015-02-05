#!/bin/bash
#$ -cwd
#$ -S /bin/bash
SAMPLE=$1
DIR=$2
TMP_DIR=/scratch/data/sort_bam_by_ref.$$
export PATH=/pod/podstore/bin/samtools:/pod/opt/bin/python:$PATH
which python
#cd ${DIR}/${SAMPLE}_outdir ; /pod/opt/bin/python /pod/podstore/software/rna_seq_tools/sort_bam_by_reference_and_name.py --input rg_alignments_sorted.bam --input-index rg_alignments_sorted.bam.bai --samtools=/pod/podstore/bin/samtools -o ${DIR}/${SAMPLE}_outdir/sort_by_ref.bam --temp-dir ${DIR}/${SAMPLE}_outdir

mkdir -p $TMP_DIR
#echo "/pod/opt/bin/python /pod/podstore/software/rna_seq_tools/sort_bam_by_reference_and_name.py --input ${DIR}/$SAMPLE.sorted.rmdup.bam --input-index ${DIR}/$SAMPLE.sorted.rmdup.bam.bai --samtools=/pod/podstore/bin/samtools -o ${DIR}/$SAMPLE.sort_by_ref.bam --temp-dir $TMP_DIR "
#/pod/opt/bin/python /pod/podstore/software/rna_seq_tools/sort_bam_by_reference_and_name.py --input ${DIR}/$SAMPLE.sorted.rmdup.bam --input-index ${DIR}/$SAMPLE.sorted.rmdup.bam.bai --samtools=/pod/podstore/bin/samtools -o ${DIR}/$SAMPLE.sort_by_ref.bam --temp-dir $TMP_DIR 2> ${SAMPLE}.err > ${SAMPLE}.log
echo /pod/opt/bin/python /pod/podstore/software/rna_seq_tools/sort_bam_by_reference_and_name.py --input ${DIR}/rg_alignments_sorted.bam --input-index ${DIR}/rg_alignments_sorted.bam.bai --samtools=/pod/podstore/bin/samtools -o ${DIR}/$SAMPLE.sort_by_ref.bam --temp-dir $TMP_DIR 
/pod/opt/bin/python /pod/podstore/software/rna_seq_tools/sort_bam_by_reference_and_name.py --input ${DIR}/rg_alignments_sorted.bam --input-index ${DIR}/rg_alignments_sorted.bam.bai --samtools=/pod/podstore/bin/samtools -o ${DIR}/$SAMPLE.sort_by_ref.bam --temp-dir $TMP_DIR 2> ${SAMPLE}.err > ${SAMPLE}.log

