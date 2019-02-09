#!/bin/bash
rm 8_sum.txt 2>/dev/null
touch 8_sum.txt
N=$(cat H.txt|wc -w)
function fn(){
	if [ $1 -eq 10 ] ; then echo $2; fi
	if [ $1 -lt 10 ] ; then
		echo $(fn $(($1+1)) $2)
		echo $(fn $(($1+1)) $(($2+$(cat H.txt|tr ' ' '\n'|head -$1|tail -1))))
	fi
}
echo $(fn 1 0)|tr ' ' '\n' |sort -n  > 8_sum.txt
cat 8_sum.txt
