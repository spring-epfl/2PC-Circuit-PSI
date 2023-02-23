GCF="../build/bin/gcf_psi"

j=0
while [ $j -lt $3 ]
do
    $GCF -r 0 -a $1 -p $2 -n 128 -d ${3} 2>&1 >/dev/null
    j=$[$j+1]
done
