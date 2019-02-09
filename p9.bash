#!/bin/bash
length=($(cat I.txt|xargs))
function len(){ echo ${length[$(($1*100+$2-101))]}; }

d=()
for i in {1..100}; do d+=(1000000000); done
d[0]=0
q=()
for i in {1..100}; do q+=(0); done
for i in {1..100}; do
	u=0
	t=1000000001
	for j in {0..99}; do
		if [ ${q[$j]} -eq 0 -a $t -gt ${d[$j]} ] ; then
			u=$j
			t=${d[$j]}
		fi
	done
	q[u]=1
	echo $u
	U=$(($u+1))
	for j in {0..99}; do
		if [ $(len $U $(($j+1))) -ne 1000000000 ] ; then
			if [ ${d[$j]} -gt $(($(len $U $(($j+1)))+${d[$u]})) ] ; then
				d[$j]=$(($(len $U $(($j+1)))+${d[$u]}))
			fi
		fi
	done
done
for i in {0..99}; do echo $i ${d[$i]}; done

