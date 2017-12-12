#!/bin/sh
awk -F "," ' 
BEGIN {print "fourteeners_attributes=["}
{ if (NR!=1) {print "\t{name:\""$2"\",\n\tsurname:\""$1"\",\n\televation_in_feet:"$3",\n\trank:"$4",\n\tlocation_lat:"$5",\n\tlocation_long:"$6",\n\tforest:\""$7"\",\n\trange:\""$8"\",\n\tclassification:"$9",\n\texposure:"$10",\n\televation_gain_in_feet:"$11",\n\tround_trip_distance_in_miles:"$12",\n\tno_4wd_additional_elevation_in_feet:"$13",\n\tno_4wd_additional_distance_in_miles:"$14",\n\troute_name:\""$15"\",\n\ttrailhead_name:\""$16"\",\n\ttrailhead_lat:"$17",\n\ttrailhead_long:"$18",\n\tfour_x_four_required:"$19",\n\tadditional_info_url:\""$20"\",\n\tkml: \""$21"\"},"}}
END{print "]"}
' $1
