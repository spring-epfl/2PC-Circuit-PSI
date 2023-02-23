#!/bin/bash

cd '/psi/2PC-Circuit-PSI/benchmarks/'


N=${1}
IP=${2}
RUNS=${3}

times='circuit-time-client.log'
log="circuit_client.log"

echo "----------------------------------------------" >>${log}
echo "N:" ${N} >>${log}

i=0

while [[ $i -lt $RUNS ]]
do
	port=$( expr 2000 + ${N} '*' 10 + ${i} )
	echo "port:" ${port} >>${log}
	echo -n "$N, " >> ${times}
	{ /usr/bin/time -f '%e, %U, %S' bash client.sh $IP $port $N >>${log} ; } 2>>${times} 
	i=$[${i} + 1]
	sleep 1
done

echo "Done ${N}."
