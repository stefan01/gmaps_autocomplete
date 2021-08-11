@JS('google.maps.places')
library places;

import 'dart:html';
import 'package:gmaps_autocomplete_web/model/gmaps.dart';
import 'package:js/js.dart';

@JS()
class Autocomplete {
  external Autocomplete(HtmlElement element, AutocompleteOptions options);

  external MapsEventListener addListener(
      String eventName, Function(String) handler);
}

@JS()
@anonymous
class AutocompleteOptions {
  external factory AutocompleteOptions({
    List<String>? fields,
    List<String>? types,
    LatLngBoundsJS? bounds,
    bool? strictBounds,
    ComponentRestrictionsJS? componentRestrictions,
    void Function(String placeId)? onSubmitted,
  });

  external List<String>? fields;
  external List<String>? types;
  external LatLngBoundsJS? bounds;
  external bool? strictBounds;
  external ComponentRestrictionsJS? componentRestrictions;
  void Function(String placeId)? onSubmitted;
}

@JS('ComponentRestrictions')
class ComponentRestrictionsJS {
  external ComponentRestrictionsJS(List<String> country);

  /// Converts a [List<String>] to a [ComponentRestrictionsJS]
  factory ComponentRestrictionsJS.fromStringList(List<String> country) {
    return ComponentRestrictionsJS(country);
  }

  external List<String> country;
}
