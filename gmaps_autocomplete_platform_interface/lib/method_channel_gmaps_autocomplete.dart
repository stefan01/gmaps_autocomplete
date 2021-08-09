import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:gmaps_autocomplete_platform_interface/gmaps_autocomplete_platform_interface.dart';

/// An implementation of [GMapsAutocompletePlatform] that uses method channels.
class MethodChannelGMapsAutocomplete extends GMapsAutocompletePlatform {
  @override
  Widget buildView() {
    return Text(
        '$defaultTargetPlatform  is not yet supported for this Platform!');
  }
}
