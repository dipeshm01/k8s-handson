#!/bin/bash
set -x
ls *.txt | grep -v edited | awk -F '.txt' '{print $1}' |xargs -I% cp %.txt %-edited.txt
ls *-edited.txt | xargs -I% echo %
ls *-edited.txt | xargs -I% mv -t destination % # mv -t destination file1 file2 file3
rm -v destination/*
set +x