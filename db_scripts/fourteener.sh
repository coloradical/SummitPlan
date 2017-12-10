#!/bin/sh
awk -F "," '
BEGIN {print "fourteeners_attributes=["}
{ if (NR!=1) {print "\t{name:\""$2"\", surname:\""$1"\", elevation_in_feet:"$3", rank:"$4", location_lat:"$5", location_long:"$6", forest:\""$7"\", range:\""$8"\", classification:"$9", exposure:"$10", elevation_gain_in_feet:"$11", round_trip_distance_in_miles:"$12", no_4wd_additional_elevation_in_feet:",$13", no_4wd_additional_distance_in_miles:"$14", route_name:\""$15"\", trailhead_name:\""$16"\", trailhead_lat:"$17", trailhead_long:"$18", four_x_four_required:"$19", additional_info_url:\""$20"\"},"}}
END{print "]"}
' $1
