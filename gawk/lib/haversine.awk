#! /usr/bin/gawk -f
@include "functions"
BEGIN {earthRadius=6378; pi=computedPi(); stopLatitude=toRadians(3.473625); stopLongitude=toRadians(-76.50695); distance=2 };
{
  if($8 ~ /131/)
  latitude=(toRadians($5))/10000000 
  longitude=(toRadians($6))/10000000 
  distanceInMeters=haversine(latitude,longitude,stopLatitude,stopLongitude)
  if(distanceInMeters<=distance)
  # printf("%.17f%.0d\n", distanceInMeters, 0)
  print $0
}

