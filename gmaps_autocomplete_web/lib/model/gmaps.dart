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
}

@JS()
@anonymous
class LatLngJS {
  // ignore: avoid_positional_boolean_parameters
  external factory LatLngJS({num lat, num lng});

  external num lat;
  external num lng;
}
