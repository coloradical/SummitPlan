#!/bin/sh
#Script to create ruby list of fourteeners from CSV file
awk -F "," '
BEGIN {print "fourteeners_attributes=["}
{if (NR!=1) {print "\t{name:\""$2"\", surname:\""$1"\", elevation_in_feet:"$3", rank:"$4", location_lat:"$5", location_long:"$6", forest:\""$7"\", range:\""$8"\", classification:"$9", exposure:"$10"},"} }
END{print "]"}
' $1
