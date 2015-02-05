#
export SAMPLE=$1
export CPU=$2
export PATH=/pod/podstore/software/rsem-1.1.13:$PATH
DIR=`dirname $SAMPLE`
INPUT=`basename $SAMPLE`

cd $DIR
/pod/opt/bin/python /pod/podstore/software/rsem/rsem-wrapper.py \
--fragment-length-mean -1 \
--fragment-length-min 1 \
--fragment-length-sd 0 \
--fragment-length-max 1000 \
--bamtype bam \
--seed-length 25 \
--reference /pod/podstore/data/reference/hg19/rsem_ref/hg19_M_rCRS_ref \
-p $CPU \
--forward-prob 0.5 \
--log rsem.log \
--output rsem_gene.v1.1.13.tab \
--bamfile transcript_sorted.v1.1.13.bam \
--bam_genome genome.v1.1.13.bam \
--isoformfile rsem_isoform.v1.1.13.tab \
--paired-end \
--bam-input $INPUT
