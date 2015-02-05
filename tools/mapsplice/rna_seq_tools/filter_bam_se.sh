#$ -cwd
#$ -S /bin/bash
#!/bin/bash
export input_bam=$1
export output_bam=$2
export mapq=$3
export max_insert=$4

UBU_PATH=/pod/podstore/software/rna_seq_tools

java -Xmx512M -jar $UBU_PATH/ubu-1.2-jar-with-dependencies.jar \
    sam-filter \
    --strip-indels \
    --max-insert ${max_insert} \
    --mapq ${mapq} \
    --in ${input_bam} \
    --out ${output_bam}

