import 'package:gmaps_autocomplete_platform_interface/model/lat_lng.dart';

/// Class representing a latitude/longitude aligned rectangle
class LatLngBounds {
  const LatLngBounds({required this.northeast, required this.southwest});

  /// The northeast corner
  final LatLng northeast;

  /// The southwest corner
  final LatLng southwest;
}
