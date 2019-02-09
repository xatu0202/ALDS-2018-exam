#!/bin/bash
cat C.txt |tr ' ' '\n'|sort -n|tail -1000|head -1
