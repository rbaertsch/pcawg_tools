#
export SAMPLE=$1
export DIR=$2
export NAME=$3
echo cd $DIR/${SAMPLE}_outdir
cd $DIR/${SAMPLE}_outdir
sed /^uc0/d rsem_gene.tab |awk -F'\t' '{OFS="\t";split($1,a,"|");$1=a[1];print $0}' > rsem.genes.results
awk -F'\t' '{OFS="\t";split($2,a,"|");$2=a[1];gn=$2"/"$1;$1=gn;print $0}' rsem_isoform.tab > rsem.isoform.results
#gene
echo perl /pod/podstore/software/rna_seq_tools/quartile_norm.pl -c 5 -q 75 -t 1000 -o rsem.genes.normalized_results rsem.genes.results
awk -F'\t' 'NR==1{$7="'${NAME}'"}{OFS="\t";print $1,$7}' rsem.genes.results > rsem.genes.raw_fpkm.tab
awk -F'\t' 'NR==1{$6="'${NAME}'"}{OFS="\t";print $1,$6}' rsem.genes.results > rsem.genes.raw_tpm.tab
awk -F'\t' 'NR==1{$5="'${NAME}'"}{OFS="\t";print $1,$5}' rsem.genes.results > rsem.genes.raw_counts.tab
perl /pod/podstore/software/rna_seq_tools/quartile_norm.pl -c 7 -q 75 -t 1000 -o rsem.c7.temp rsem.genes.results
awk -F'\t' 'NR==1{$2="'${NAME}'"}{OFS="\t";print $0}' rsem.c7.temp > rsem.genes.norm_fpkm.tab
perl /pod/podstore/software/rna_seq_tools/quartile_norm.pl -c 6 -q 75 -t 1000 -o rsem.c6.temp rsem.genes.results
awk -F'\t' 'NR==1{$2="'${NAME}'"}{OFS="\t";print $0}' rsem.c6.temp > rsem.genes.norm_tpm.tab
perl /pod/podstore/software/rna_seq_tools/quartile_norm.pl -c 5 -q 75 -t 1000 -o rsem.c5.temp rsem.genes.results
awk -F'\t' 'NR==1{$2="'${NAME}'"}{OFS="\t";print $0}' rsem.c5.temp > rsem.genes.norm_counts.tab
#
awk -F'\t' 'NR==1{$7="'${NAME}'"}{OFS="\t";print $1,$7}' rsem.isoform.results > rsem.isoform.raw_fpkm.tab
awk -F'\t' 'NR==1{$6="'${NAME}'"}{OFS="\t";print $1,$6}' rsem.isoform.results > rsem.isoform.raw_tpm.tab
awk -F'\t' 'NR==1{$5="'${NAME}'"}{OFS="\t";print $1,$5}' rsem.isoform.results > rsem.isoform.raw_counts.tab
perl /pod/podstore/software/rna_seq_tools/quartile_norm.pl -c 7 -q 75 -t 1000 -o rsem.isoform.c7.temp rsem.isoform.results
awk -F'\t' 'NR==1{$2="'${NAME}'"}{OFS="\t";print $0}' rsem.isoform.c7.temp > rsem.isoform.norm_fpkm.tab
perl /pod/podstore/software/rna_seq_tools/quartile_norm.pl -c 6 -q 75 -t 1000 -o rsem.isoform.c6.temp rsem.isoform.results
awk -F'\t' 'NR==1{$2="'${NAME}'"}{OFS="\t";print $0}' rsem.isoform.c6.temp > rsem.isoform.norm_tpm.tab
perl /pod/podstore/software/rna_seq_tools/quartile_norm.pl -c 5 -q 75 -t 1000 -o rsem.isoform.c5.temp rsem.isoform.results
awk -F'\t' 'NR==1{$2="'${NAME}'"}{OFS="\t";print $0}' rsem.isoform.c5.temp > rsem.isoform.norm_counts.tab
