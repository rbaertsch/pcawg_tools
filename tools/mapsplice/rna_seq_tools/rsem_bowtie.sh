#$ -cwd
#$ -S /bin/bash
#!/bin/bash
export SAMPLE=$1
export CPU=$2
export PATH=/pod/podstore/software/rsem-1.2.3:$PATH
DIR=`dirname $SAMPLE`
INPUT=`basename $SAMPLE`
echo "dir" $DIR
echo "INPUT" $INPUT
echo "pwd" `pwd`

cd $DIR
rsem-calculate-expression \
-p $CPU \
--output-genome-bam \
$SAMPLE\
/pod/podstore/data/reference/hg19/rsem_ref/hg19_M_rCRS_ref 


exit
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
--output rsem_gene.tab \
--bam_genome genome.bam \
--isoformfile rsem_isoform.tab \
--bam-input $INPUT
