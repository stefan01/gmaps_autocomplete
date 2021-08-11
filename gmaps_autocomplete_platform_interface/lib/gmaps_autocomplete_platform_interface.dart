import 'package:flutter/widgets.dart';
import 'package:gmaps_autocomplete_platform_interface/method_channel_gmaps_autocomplete.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:gmaps_autocomplete_platform_interface/model/lat_lng_bounds.dart';

abstract class GMapsAutocompletePlatform extends PlatformInterface {
  /// Constructs a UrlLauncherPlatform.
  GMapsAutocompletePlatform() : super(token: _token);

  static final Object _token = Object();

  static GMapsAutocompletePlatform _instance = MethodChannelGMapsAutocomplete();

  /// The default instance of [GMapsAutocompletePlatform] to use.
  ///
  /// Defaults to [MethodChannelUrlLauncher].
  static GMapsAutocompletePlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [UrlLauncherPlatform] when they register themselves.
  static set instance(GMapsAutocompletePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Returns a widget displaying the autocomplete text field
  Widget buildView({
    List<String>? fields,
    List<String>? types,
    LatLngBounds? bounds,
    bool? strictBounds,
    List<String>? componentRestrictions,
    void Function(String placeId)? onSubmitted,
  }) {
    throw UnimplementedError('buildView() has not been implemented.');
  }
}
