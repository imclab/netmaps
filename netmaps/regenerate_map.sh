#!/bin/bash

set -u
set -o  errexit

source set_common_script_variables.sh

./update_caida_as_relationship_data.sh

echo "rebuilding results"

mkdir -p results/graphs
./make_asn_graph.pl < `cat $NEWEST_AS_REL_LOCATION_FILE `
mv results $WEB_DIRECTORY/results_new
rm -rf $WEB_DIRECTORY/results_old
mv $WEB_DIRECTORY/results $WEB_DIRECTORY/results_old
mv $WEB_DIRECTORY/results_new  $WEB_DIRECTORY/results
mv $NEWEST_AS_REL_LOCATION_FILE $LAST_AS_REL_LOCATION_FILE
