#!/bin/bash
#$ -cwd
#$ -S /bin/bash
export BIN=/pod/podstore/software
MAPSPLICE_DIR="$BIN/MapSplice-v2.1.0"
SAMPDIR=$1
SAMP=`basename $1`
#python mapsplice_multi_thread.py --fusion --all-chromosomes-files hg19_M_rCRS/hg19_M_rCRS.fa --pairend -X 8 -Q fq --chromosome-filesdir
#hg19_M_rCRS/chromosomes --Bowtieidx hg19_M_rCRS/ebwt/humanchridx_M_rCRS -1 working/prep_1.fastq -2 working/prep_2.fastq -o
#SAMPLE_BARCODE 2> working/mapsplice.log
    #--chromosome-dir /pod/podstore/data/reference/hg19/hg19_M_rCRS/chromosomes \
    #--all-chromosomes-files hg19_M_rCRS/hg19_M_rCRS.fa \
    #--pairend \
    #--Bowtieidx hg19_M_rCRS/ebwt/humanchridx_M_rCRS \

echo "Dir $SAMPDIR file $SAMP"
python ${MAPSPLICE_DIR}/mapsplice.py  \
    -p 32  \
    -s 25 \
    --bam \
    --min-map-len 50 \
    -x /pod/podstore/data/reference/hg19/hg19_M_rCRS/ebwt/humanchridx_M_rCRS \
    --chromosome-dir /pod/podstore/data/reference/hg19/hg19_M_rCRS/chromosomes \
    -1 ${SAMPDIR}/${SAMP}_R1.fastq\
    -2 ${SAMPDIR}/${SAMP}_R2.fastq\
    -o ${SAMP}_outdir

rc=$?
if [[ $rc != 0 ]] ; then
    exit $rc
fi

#samtools sort ${SAMP}_outdir/alignments.bam ${SAMP}_outdir/alignments_sorted
#rc=$?
#if [[ $rc != 0 ]] ; then
#    exit $rc
#fi
exit
