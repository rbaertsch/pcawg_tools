#!/bin/bash
#$ -cwd
#$ -S /bin/bash
INPUT=$1
DIR=`dirname ${INPUT}`
PATH=$PATH:/pod/podstore/bin
echo "stderr :" $DIR/sort_index.err
echo -n "PWD: "
pwd
echo samtools sort ${INPUT} ${INPUT%%.bam}_sorted ; samtools index ${INPUT%%.bam}_sorted.bam 
samtools sort ${INPUT} ${INPUT%%.bam}_sorted 2> $DIR/sort_index.err ; samtools index ${INPUT%%.bam}_sorted.bam 2>> $DIR/sort_index.err
