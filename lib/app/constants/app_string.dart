import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class AppString {
  static LatLng myLocation = LatLng(35.821430, 10.634422);
  static const double kDefaultBorder = 25;
  static const double kDefaultSpacing = 25;
  static const double kMarkSizeExpanded = 50;
  static const double kMarkSizeSmall = 35;
  static const String MAPBOX_TOKEN =
      'pk.eyJ1IjoiaGFiY291biIsImEiOiJja3R3anBwbXkxNGE5MzNxbm52bWNpbDR2In0.cYjvZIsJDIx3N6ruziovOQ';
  static const String MAPBOX_STYLE = 'mapbox/light-v10';
  static const String URL_TEMPLATE =
      'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}';
  static const Color kPrimaryColors = Color(0xFFB00000);
}
