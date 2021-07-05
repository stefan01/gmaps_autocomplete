
import 'dart:async';

import 'package:flutter/services.dart';

class GoogleMapsPlacesAutocomplete {
  static const MethodChannel _channel =
      const MethodChannel('google_maps_places_autocomplete');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
