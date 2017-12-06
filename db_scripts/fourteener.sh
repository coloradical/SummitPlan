#!/bin/sh
#Script to create ruby list of fourteeners from CSV file
awk -F "," '
BEGIN {print "fourteeners_attributes=["}
{if (NR!=1) {print "\t{name:\""$2"\", surname:\""$1"\", elevation_in_feet:"$3", rank:"$4", location_lat:"$4", location_long:"$5", forest:\""$6"\", range:\""$7"\", classification:"$8", exposure:"$9"},"} }
END{print "]"}
' $1
