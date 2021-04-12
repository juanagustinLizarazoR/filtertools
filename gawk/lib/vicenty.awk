#! /usr/bin/gawk -f
@include "functions"
BEGIN {a = 6378137; b = 6356752.314245; f =1/298.257223563;distance=10; stopLatitude=3.473625; stopLongitude=-76.50695};
{
  if($8 ~ /131/)
  latitude=(toRadians($5))/10000000 
  longitude=(toRadians($6))/10000000
  distanceInMeters=vicenty(latitude,longitude,stopLatitude,stopLongitude)
  if(distanceInMeters<=distance)
  printf("%.17f%.0d\n", distanceInMeters, 0)
  # print $0
}