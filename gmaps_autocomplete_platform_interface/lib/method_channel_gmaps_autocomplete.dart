import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'url_launcher_platform_interface.dart';

const MethodChannel _channel =
    MethodChannel('gmaps_autocomplete/gmaps_autocomplete');

class MethodChannelGMapsAutocomplete extends GMapsAutocompletePlatform {
  @override
  Widget buildView() {
    return Text(
        '$defaultTargetPlatform  is not yet supported for this Platform!');
  }
}
