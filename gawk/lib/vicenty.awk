#! /usr/bin/gawk -f
@include "functions"
BEGIN {distance=1; stopLatitude=3.473625; stopLongitude=-76.50695};
{
  if($8 ~ /131/)
  latitude=($5)/10000000 
  longitude=($6)/10000000
  distanceInMeters=vicenty(latitude,longitude,stopLatitude,stopLongitude)*1000
  if(distanceInMeters<=distance)
  # print distanceInMeters
  printf("%.17f%.0d\n", distanceInMeters, 0)
  # print $0
}