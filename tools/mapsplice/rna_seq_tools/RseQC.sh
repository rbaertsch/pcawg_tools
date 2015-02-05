#!/bin/bash

###The following script will run
#Bam stat
#Genebody coverage
#Infer Experiment 
#Inner distance
#Read distribution
#Read GC
#Read NVC
#Read Quality
#Rpkm count

export PATH=/pod/podstore/software/RSeQC/pod/opt/bin:$PATH
export PYTHONPATH=/pod/podstore/software/RSeQC/pod/opt/lib/python2.7/site-packages:$PYTHONPATH
export PATH=$PATH:/pod/podstore/bin/

RSEQC_DIR=/pod/podstore/software/RSeQC-2.3.9/scripts

#Unique bam ends with .sorted.rmdup.bam
SAMPLE_NAME_OUTDIR=$1
SAMPLE_NAME=$2

#this gene model was downloaded from the rseqc website
REF_GENE_BED=/pod/podstore/data/reference/hg19_UCSC_knownGene.bed

## Index bam file (forgot to do it in last step)
##EX: samtools index /pod/podstore/projects/pourmand_lab/NG_NS_100.1_outdir/NG_NS_100.1.sorted.rmdup.bam 2>> /pod/podstore/projects/pourmand_lab/NG_NS_100.1_outdir/test_sort_index.err
samtools index /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/$SAMPLE_NAME.sorted.rmdup.bam 2>> /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/$SAMPLE_NAME.sort_index.err


#Bam stat
##EX: /opt/python/bin/python2.7 /pod/podstore/software/RSeQC-2.3.9/scripts/bam_stat.py -i /pod/podstore/projects/pourmand_lab/NG_NS_100.1_outdir/NG_NS_100.1.sorted.rmdup.bam 2> /pod/podstore/projects/pourmand_lab/NG_NS_100.1_outdir/NG_NS_100.1.bam.stat
/opt/python/bin/python2.7 $RSEQC_DIR/bam_stat.py -i /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/$SAMPLE_NAME.sorted.rmdup.bam 2> /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/$SAMPLE_NAME.bam.stat 

#Genebody coverage
##EX: /opt/python/bin/python2.7 /pod/podstore/software/RSeQC-2.3.9/scripts/geneBody_coverage.py -r /pod/podstore/data/reference/hg19_UCSC_knownGene.bed -i /pod/podstore/projects/pourmand_lab/NG_NS_100.1_outdir/NG_NS_100.1.sorted.rmdup.bam -o /pod/podstore/projects/pourmand_lab/NG_NS_100.1_outdir/NG_NS_100.1
/opt/python/bin/python2.7 $RSEQC_DIR/geneBody_coverage.py -r $REF_GENE_BED -i /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/$SAMPLE_NAME.sorted.rmdup.bam -o /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/$SAMPLE_NAME

#Infer experiment
##EX: /opt/python/bin/python2.7 /pod/podstore/software/RSeQC-2.3.9/scripts/infer_experiment.py -r /pod/podstore/data/reference/hg19_UCSC_knownGene.bed -i /pod/podstore/projects/pourmand_lab/NG_NS_100.1_outdir/NG_NS_100.1.sorted.rmdup.bam > /pod/podstore/projects/pourmand_lab/NG_NS_100.1_outdir/NG_NS_100.1.infer.experiment
/opt/python/bin/python2.7 $RSEQC_DIR/infer_experiment.py -r $REF_GENE_BED -i /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/$SAMPLE_NAME.sorted.rmdup.bam > /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/$SAMPLE_NAME.infer.experiment


#Infer distance
##EX: /opt/python/bin/python2.7 /pod/podstore/software/RSeQC-2.3.9/scripts/inner_distance.py -i /pod/podstore/projects/pourmand_lab/NG_NS_100.1_outdir/NG_NS_100.1.sorted.rmdup.bam -o /pod/podstore/projects/pourmand_lab/NG_NS_100.1_outdir/NG_NS_100.1 -r /pod/podstore/data/reference/hg19_UCSC_knownGene.bed
/opt/python/bin/python2.7 $RSEQC_DIR/inner_distance.py -i /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/$SAMPLE_NAME.sorted.rmdup.bam -o /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/$SAMPLE_NAME -r $REF_GENE_BED

#Read distribution
##EX: /opt/python/bin/python2.7 /pod/podstore/software/RSeQC-2.3.9/scripts/read_distribution.py -i /pod/podstore/projects/pourmand_lab/NG_NS_100.1_outdir/NG_NS_100.1.sorted.rmdup.bam -r /pod/podstore/data/reference/hg19_UCSC_knownGene.bed > /pod/podstore/projects/pourmand_lab/NG_NS_100.1_outdir/NG_NS_100.1.read.distribution
/opt/python/bin/python2.7 $RSEQC_DIR/read_distribution.py -i /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/$SAMPLE_NAME.sorted.rmdup.bam -r $REF_GENE_BED > /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/$SAMPLE_NAME.read_distribution

#Read_GC
##EX: /opt/python/bin/python2.7 /pod/podstore/software/RSeQC-2.3.9/scripts/read_GC.py -i /pod/podstore/projects/pourmand_lab/NG_NS_100.1_outdir/NG_NS_100.1.sorted.rmdup.bam -o /pod/podstore/projects/pourmand_lab/NG_NS_100.1_outdir/NG_NS_100.1.readGC
/opt/python/bin/python2.7 $RSEQC_DIR/read_GC.py -i /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/$SAMPLE_NAME.sorted.rmdup.bam -o /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/$SAMPLE_NAME

#READ_NVC
##EX: /opt/python/bin/python2.7 /pod/podstore/software/RSeQC-2.3.9/scripts/read_NVC.py -i /pod/podstore/projects/pourmand_lab/NG_NS_100.1_outdir/NG_NS_100.1.sorted.rmdup.bam  -o /pod/podstore/projects/pourmand_lab/NG_NS_100.1_outdir/NG_NS_100.1.read_NVC
/opt/python/bin/python2.7 $RSEQC_DIR/read_NVC.py -i /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/$SAMPLE_NAME.sorted.rmdup.bam -o /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/$SAMPLE_NAME

#Read quality
##EX: /opt/python/bin/python2.7 /pod/podstore/software/RSeQC-2.3.9/scripts/read_quality.py -i /pod/podstore/projects/pourmand_lab/NG_NS_100.1_outdir/NG_NS_100.1.sorted.rmdup.bam  -o /pod/podstore/projects/pourmand_lab/NG_NS_100.1_outdir/NG_NS_100.1.read_quality
/opt/python/bin/python2.7 $RSEQC_DIR/read_quality.py -i /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/$SAMPLE_NAME.sorted.rmdup.bam -o /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/$SAMPLE_NAME

#RPKM count
##EX: /opt/python/bin/python2.7 /pod/podstore/software/RSeQC-2.3.9/scripts/RPKM_count.py -i /pod/podstore/projects/pourmand_lab/NG_NS_100.1_outdir/NG_NS_100.1.sorted.rmdup.bam -r /pod/podstore/data/reference/hg19_UCSC_knownGene.bed -o /pod/podstore/projects/pourmand_lab/NG_NS_100.1_outdir/NG_NS_100.1.rpkm.count
/opt/python/bin/python27 $RSEQC_DIR/RPKM_count.py -i /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/$SAMPLE_NAME.sorted.rmdup.bam -r $REF_GENE_BED -o /pod/podstore/projects/pourmand_lab/$SAMPLE_NAME_OUTDIR/$SAMPLE_NAME.rpkm.count 


