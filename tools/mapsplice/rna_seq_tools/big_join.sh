#
list=$1
output=$2
first=`head -2 $list |transpose.pl |cut -f1` 
second=`head -2 $list |transpose.pl |cut -f2` 
grep -v "SLC35E2" $first > temp1.tab
grep -v "SLC35E2" $second > temp2.tab
echo join.pl -o NANA $first $second  tmp.txt
join.pl -o NANA temp1.tab temp2.tab > tmp.txt
cp tmp.txt tmp0.txt
echo -c 'first join '
wc -l tmp.txt $first $second
for i in `tail -n +3 $list` ; do echo $i ; join.pl tmp.txt $i > temp2.txt ; mv temp2.txt tmp.txt ; wc -l tmp.txt ; head -1 tmp.txt|cut -f1-5 ; done
mv tmp.txt $output
