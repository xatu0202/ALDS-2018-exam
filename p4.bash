#!/bin/bash
#cat D.txt |tr ' ' '\n'|sort -n > D_sorted.txt
a=($(cat D_sorted.txt))
echo load finish
for i in {0..1999998}; do
	if [ ${a[$i]} -eq ${a[$(($i+1))]} ] ; then
		echo ${a[$i]}
	fi
done
