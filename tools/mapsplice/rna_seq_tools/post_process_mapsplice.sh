#!/bin/bash
#$ -cwd
#$ -S /bin/bash
export BIN=/pod/podstore/software
#
#post mapsplice pipeline
#step 3 - addreadgroups.sh
#step 4 - sort.jobs - sam sort
#step 5 - index.jobs - sam index
#step 6 - sort_bam_by_reference_and_name.py - sort by reference 
#step 7 - transcriptome_bam.sh - map to bam to transcriptome - output is transcriptome2.bam
#step 8 - filter.jobs - filter_bam.sh - filter transcriptome bams
##step 9 - flag stats

SAMPLE=$1
#step 3
/pod/podstore/software/rna_seq_tools/addreadgroup.sh ${SAMPLE} 
#step 4
/pod/podstore/software/rna_seq_tools/bamsort_and_index.sh ${SAMPLE}_outdir/rg_alignments.bam
#step 5 & 6 
/pod/podstore/software/rna_seq_tools/sort_bam_by_reference_and_name.sh ${SAMPLE} `pwd`/${SAMPLE}_outdir 
#step 7
/pod/podstore/software/rna_seq_tools/transcriptome_bam.sh ${SAMPLE}_outdir/${SAMPLE}.sort_by_ref.bam /pod/podstore/data/reference/hg19/unc_hg19.bed ${SAMPLE}_outdir/transcriptome.bam /pod/podstore/data/reference/hg19/hg19_M_rCRS_ref.transcripts.fa  
#step 8
/pod/podstore/software/rna_seq_tools/filter_bam.sh ${SAMPLE}_outdir/transcriptome.bam ${SAMPLE}_outdir/filtered.bam 1 1000
#step 9
samtools flagstat ${SAMPLE}_outdir/rg_alignments_sorted.bam> ${SAMPLE}_outdir/sorted_genome_alignments.bam.flagstat 
