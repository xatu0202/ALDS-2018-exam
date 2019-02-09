#!/bin/bash
cat B.txt |xargs -n 1|sort -n|head -51|tail -1
