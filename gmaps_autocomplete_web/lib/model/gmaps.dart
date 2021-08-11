@JS('google.maps')
library gmaps;

import 'package:gmaps_autocomplete_platform_interface/model/lat_lng.dart';
import 'package:gmaps_autocomplete_platform_interface/model/lat_lng_bounds.dart';
import 'package:js/js.dart';

@JS()
class MapsEventListener {
  external MapsEventListener();

  external void remove();
}

@JS('LatLngBounds')
class LatLngBoundsJS {
  external LatLngBoundsJS(LatLngJS northeast, LatLngJS southwest);

  /// Converts a [LatLngBounds] to a [LatLngBoundsJs]
  factory LatLngBoundsJS.fromLatLngBounds(LatLngBounds latLngBounds) {
    return LatLngBoundsJS(
      LatLngJS.fromLatLng(latLngBounds.northeast),
      LatLngJS.fromLatLng(latLngBounds.southwest),
    );
  }
}

@JS('LatLng')
class LatLngJS {
  external LatLngJS(double latitude, double longitude);

  /// Converts a [LatLng] to a [LatLngJS]
  factory LatLngJS.fromLatLng(LatLng latLng) {
    return LatLngJS(latLng.latitude, latLng.longitude);
  }
}
