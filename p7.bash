#!/bin/bash
N=$(cat G.txt|wc -l)
n=$(($N-1))
arr=($((cat G.txt |head -1;cat G.txt|tail -$n|sed 's/..\? //g') |tr '\r\n' ' '|xargs));
echo ${arr[@]}

for ((i=1; i<=$N; i++)); do
	dp[$(($i*$N+$i))]=0;
done
for ((l=2; l<=$N; l++));do
	for ((i=1; i<=$(($N-l+1)); i++)); do
		j=$(($i+$l-1))
		dp[$(($i*$N+$j))]=1000000000
		for ((k=$i; k<=$(($j-1)); k++)); do
			q=$((${dp[$(($i*$N+$k))]}+${dp[$(($k*$N+$j+$N))]}+${arr[$(($i-1))]}*${arr[$k]}*${arr[$j]}))
			if [ ${dp[$(($i*$N+$j))]} -gt $q ] ; then
				dp[$(($i*$N+$j))]=$q
			fi
		done
	done
done

echo ${dp[$(($N+$N))]}

