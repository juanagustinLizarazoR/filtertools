#! /usr/bin/gawk -f
function abs(v){
  return v < 0 ? -v : v
}
function asin(x){
  return atan2(x,sqrt(1-x*x));
}
function computedPi(){
  return atan2(0,-1);
}
function toRadians(degree){
  return degree*(pi/180);
}
function tan(x){
  return sin(x)/cos(x);
}
function atan(x){
  return cos(x)/sin(x);
}
function haversine(latitude,longitude,stopLatitude,stopLongitude){
  differenceLat=latitude-stopLatitude 
  differenceLong=longitude-stopLongitude 
  sinLat=sin(differenceLat/2) 
  sinLong=sin(differenceLong/2) 
  a=(sinLat*sinLat)+cos(stopLatitude)*cos(latitude)*(sinLong*sinLong) 
  inputA=sqrt(a)
  c=2*asin(inputA)
  distanceInMeters=earthRadius*c*1000
  return distanceInMeters;
}
function vicenty(latitude,longitude,stopLatitude,stopLongitude){
  lambda=toRadians(stopLongitude-longitude)
  U1=atan((1-f)*tan(toRadians(stopLatitude)))
  U2=atan((1-f)*tan(toRadians(latitude)))
  sinU1=sin(U1)
  cosU1=cos(U1)
  sinU2=sin(U2)
  cosU2=cos(U2)
  iterLimit=100
  do {
    sinLambda=sin(lambda)
    cosLambda=cos(lambda)
    sinSigma=sqrt((cosU2 * sinLambda)*(cosU2 * sinLambda)+(cosU1 * sinU2 - sinU1 * cosU2 * cosLambda)*(cosU1 * sinU2 - sinU1 * cosU2 * cosLambda))
    if (sinSigma == 0) return 0;
    cosSigma = sinU1 * sinU2 + cosU1 * cosU2 * cosLambda
    sigma=atan2(sinSigma,cosSigma)
    sinAlpha = cosU1 * cosU2 * sinLambda / sinSigma
    cosSqAlpha = 1 - sinAlpha * sinAlpha
    cos2SigmaM = cosSigma - 2 * sinU1 * sinU2 / cosSqAlpha
    C = f / 16 * cosSqAlpha * (4 + f * (4 - 3 * cosSqAlpha))
    lambdaP = lambda
    lambda =  L + (1 - C) * f * sinAlpha * (sigma + C * sinSigma * (cos2SigmaM + C * cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM)));
  } while (abs(lambda - lambdaP) > 1e-12 && --iterLimit > 0)
    if (iterLimit == 0) return 0;
    uSq = cosSqAlpha * (a * a - b * b) / (b * b);
    A = 1 + uSq / 16384 * (4096 + uSq * (-768 + uSq * (320 - 175 * uSq)));
    B = uSq / 1024 * (256 + uSq * (-128 + uSq * (74 - 47 * uSq)));
    deltaSigma = B * sinSigma * (cos2SigmaM + B / 4 * (cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM) - B / 6 * cos2SigmaM * (-3 + 4 * sinSigma * sinSigma) * (-3 + 4 * cos2SigmaM * cos2SigmaM)));
    s = b * A * (sigma - deltaSigma);
    return s;
  }
