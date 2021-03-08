import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String getType(String string) {
  String temp = '';
  switch (string) {
    case 'Purbalingga-Purwokerto':
      {
        temp = 'Purbalingga-Purwokerto';
      }
      break;
    case 'Purwokerto-Purbalingga':
      {
        temp = 'Purwokerto-Purbalingga';
      }
      break;
  }
  return temp;
}

Color getColor(String s) {
  Color temp;
  switch (s) {
    case 'pwt':
      {
        temp = Colors.orange;
      }
      break;
    case 'pbg':
      {
        temp = Colors.blue;
      }
      break;
    default:
      {
        temp = Colors.black54;
      }
      break;
  }
  return temp;
}

//Creating a method using Haversine Formula
String CalculationByDistance(
    double initialLat, double initialLong, double finalLat, double finalLong) {
  int R = 6371; // km (Earth radius)
  double dLat = toRadians(finalLat - initialLat);
  double dLon = toRadians(finalLong - initialLong);
  initialLat = toRadians(initialLat);
  finalLat = toRadians(finalLat);

  double a = sin(dLat / 2) * sin(dLat / 2) +
      sin(dLon / 2) * sin(dLon / 2) * cos(initialLat) * cos(finalLat);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  return (R * c).toStringAsFixed(1);
}

LatLng MidPoint(double lat1, double long1, double lat2, double long2) {
  // Convert the latitudes
  // and longitudes
  // from degree to radians.
  double Bx = cos(lat2) * cos(long2 - long1);
  double By = cos(lat2) * sin(long2 - long1);

  double lonMid = long1 + atan2(By, cos(lat1) + Bx);
  double latMid = (lat1 + lat2) / 2;

  print(latMid);
  print(lonMid);
  return LatLng(latMid, lonMid);
}

double toRadians(double deg) {
  return deg * (pi / 180);
}
