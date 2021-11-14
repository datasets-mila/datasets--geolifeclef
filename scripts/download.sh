#!/bin/bash
source scripts/utils.sh echo -n

# Saner programming env: these switches turn some bugs into errors
set -o errexit -o pipefail

# This script is meant to be used with the command 'datalad run'
python3 -m pip install -r scripts/requirements_download.txt

kaggle competitions download -c geolifeclef-2022-lifeclef-2022-fgvc9
git-annex add geolifeclef-2022-lifeclef-2022-fgvc9.zip

[[ -f md5sums ]] && md5sum -c md5sums
[[ -f md5sums ]] || md5sum $(list -- --fast) > md5sums
