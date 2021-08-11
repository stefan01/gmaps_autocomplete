@JS('google.maps.places')
library places;

import 'dart:html';
import 'package:gmaps_autocomplete_web/model/gmaps.dart';
import 'package:js/js.dart';

@JS()
class Autocomplete {
  external Autocomplete(HtmlElement element, AutocompleteOptions options);

  external MapsEventListener addListener(
    String eventName,
    Function handler,
  );

  external PlaceResultJS getPlace();
}

@JS()
@anonymous
class PlaceResultJS {
  external factory PlaceResultJS({
    List<GeocoderAddressComponentJS>? address_components,
    String? adr_address,
    //List<PlaceAspectRating>? aspects,
    //BusinessStatus? business_status,
    String? formatted_address,
    String? formatted_phone_number,
    //PlaceGeometry? geometry,
    List<String>? html_attributions,
    String? icon,
    String? icon_background_color,
    String? icon_mask_base_uri,
    String? international_phone_number,
    String? name,
    //PlaceOpeningHours? opening_hours,
    //List<PlacePhoto> photos,
    String? place_id,
    //PlacePlusCode? plus_code,
    num? price_level,
    num? ratings,
    //List<PlaceReview>? reviews,
    List<String>? types,
    String? url,
    num? user_ratings_total,
    num? utc_offset,
    num? utc_offset_minutes,
    String? vicinitiy,
    String? website,
  });

  external List<GeocoderAddressComponentJS>? address_components;
  external String? adr_address;
  // externalList<PlaceAspectRating>? aspects;
  // externalBusinessStatus? business_status;
  external String? formatted_address;
  external String? formatted_phone_number;
  // external PlaceGeometry? geometry;
  external List<String>? html_attributions;
  external String? icon;
  external String? icon_background_color;
  external String? icon_mask_base_uri;
  external String? international_phone_number;
  external String? name;
  // external PlaceOpeningHours? opening_hours;
  // external List<PlacePhoto> photos;
  external String? place_id;
  // external PlacePlusCode? plus_code;
  external num? price_level;
  external num? ratings;
  // external List<PlaceReview>? reviews;
  external List<String>? types;
  external String? url;
  external num? user_ratings_total;
  external num? utc_offset;
  external num? utc_offset_minutes;
  external String? vicinitiy;
  external String? website;
}

@JS()
@anonymous
class GeocoderAddressComponentJS {
  external factory GeocoderAddressComponentJS({
    required String long_name,
    required String short_name,
    required List<String> types,
  });

  external String long_name;
  external String short_name;
  external List<String> types;
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
  });

  external List<String>? fields;
  external List<String>? types;
  external LatLngBoundsJS? bounds;
  external bool? strictBounds;
  external ComponentRestrictionsJS? componentRestrictions;
}

@JS()
@anonymous
class ComponentRestrictionsJS {
  external factory ComponentRestrictionsJS({List<String> country});

  external List<String> country;
}
