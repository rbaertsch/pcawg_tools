#
export SAMPLE=$1
cd ${SAMPLE}_outdir
awk -F'\t' 'NR==2{$2="'${SAMPLE}'";$3=$2}{OFS="\t";print $0}' stats.txt |cut -f2-14|grep -v "######" | grep -v "By pairing types" | grep -v "By alignment types" | grep -v "Splice junction" | grep -v "Fusion junctions" | grep -v "Filtered fusions" | grep -v "Indel" > ${SAMPLE}_stats_all.txt
cut -f1 ${SAMPLE}_stats_all.txt | awk 'NR>1 && length($1)>1{ printf ("%'"'"'d\n", $1) }NR==1 || length($1)<=1'> ${SAMPLE}_stats2.txt
