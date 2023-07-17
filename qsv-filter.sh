#!/bin/bash -e
# requires cargo install qsv --locked --features feature_capable
# generate csv for internal transfers
qsv search --select 11 -i '.+' -o ${1}-transfers.csv ${1}
# generate csv for external deposit and withdrawls
qsv search --select 11 -i -v '.+' -o ${1}-externals.csv ${1}


qsv search --select 3 -i '^TRANSFER FROM T M M CANTWELL.+' .\${1} -o .\${1}-exclude.csv

qsv exclude 'Memo/Description' .\${1} 'Memo/Description' .\${1}-exclude.csv -o ${1}-without-transferfrom.csv