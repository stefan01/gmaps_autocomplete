import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:gmaps_autocomplete_platform_interface/gmaps_autocomplete_platform_interface.dart';
import 'package:gmaps_autocomplete_platform_interface/model/lat_lng_bounds.dart';

/// An implementation of [GMapsAutocompletePlatform] that uses method channels.
class MethodChannelGMapsAutocomplete extends GMapsAutocompletePlatform {
  @override
  Widget buildView({
    List<String>? fields,
    List<String>? types,
    LatLngBounds? bounds,
    bool? strictBounds,
    List<String>? componentRestrictions,
    bool? placeIdOnly,
    void Function(String placeId)? onSubmitted,
  }) {
    return Text(
        '$defaultTargetPlatform  is not yet supported for this Platform!');
  }
}
