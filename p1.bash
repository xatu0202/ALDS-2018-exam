#!/bin/bash
cat A.txt |grep -E [02468]$|wc -l
