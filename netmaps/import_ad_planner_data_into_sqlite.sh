#!/bin/bash

set -u
set -o  errexit

find ONI\ Adplanner/ -type f -print0 | xargs -0  ./import_ad_words_csv.pl
