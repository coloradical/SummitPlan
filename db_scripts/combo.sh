#!/bin/sh
awk -F "," '  
BEGIN {print "trails_data=["}
{if (NR!=1) {print "\t{\n\t\tattributes:{ name:\""$17"\", elevation_gain_in_feet:"$13", round_trip_distance_in_miles:"$12", no_4wd_additional_elevation_in_feet:"$14", no_4wd_additional_distance_in_miles:"$15", route_name:\""$16"\", trailhead_lat:"$18", trailhead_long:"$19", four_x_four_required:"$20", additional_info_url:\""$21"\"},\n\t\tfourteener_names: [\""$2"\",\""$3"\"]\n\t},"} }
END{print "]"}
' $1


#BEGIN {print "trails_data=["}
#{print "\t{name:"$2", surname:"$1", elevation_in_feet:"$3", rank:"$4", location_lat:"$4", location_long:"$5", forest:"$6", range:"$7", classification:"$8", exposure:"$9", elevation_gain_in_feet:"${10}", round_trip_distance_in_miles:"${11}", no_4wd_additional_elevation_in_feet:",${12}", no_4wd_additional_distance_in_miles:"${13}", route_name:"${14}", trailhead_name:"${15}", trailhead_lat:"${16}", trailhead_long:"${17}", four_x_four_required:"${18}", additional_info_url:"${19}}
#END{print "]"}
#' $1
