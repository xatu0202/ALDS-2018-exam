#!/bin/bash
f[0]=1
f[1]=1
for ((i=2;i<=90;i++)) ; do
	f[$i]=$(echo ${f[$(($i-1))]}+${f[$(($i-2))]}|bc)
done
echo ${f[$(cat E.txt)]}
