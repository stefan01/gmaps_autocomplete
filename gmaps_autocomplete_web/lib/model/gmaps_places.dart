@JS('google.maps.places')
library places;

import 'dart:html';
import 'package:js/js.dart';

@JS()
class Autocomplete {
  external Autocomplete(HtmlElement element, AutocompleteOptions options);

  external MapEventListener addListener(String eventName, Function handler);
}

@JS()
@anonymous
class AutocompleteOptions {
  external factory AutocompleteOptions({
    List<String>? fields,
    List<String>? types,
    LatLngBoundsJS? bounds,
    bool? strictBounds,
    List<String>? componentRestrictions,
    bool? placeIdOnly,
    void Function(String placeId)? onSubmitted,
  });

  external List<String>? fields;
  external List<String>? types;
  external LatLngBoundsJS? bounds;
  external bool? strictBounds;
  external List<String>? componentRestrictions;
  external bool? placeIdOnly;
  external void Function(String placeId)? onSubmitted;
}

@JS('LatLngBounds')
class LatLngBoundsJS {
  external LatLngBoundsJS(LatLngJS northeast, LatLngJS southwest);
}

@JS('LatLng')
class LatLngJS {
  external LatLngJS(double latitude, double longitude);
}
