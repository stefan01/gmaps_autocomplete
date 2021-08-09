import 'package:flutter/widgets.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:gmaps_autocomplete_platform_interface/gmaps_autocomplete_platform_interface.dart';

// import 'dart:io' if (dart.library.html) 'dart:ui' as ui;
import 'dart:ui' as ui;
import 'dart:html' as html;

/// The web implementation of [GMapsAutocompletePlatform].
///
/// This class implements the `package:gmaps_autocomplete` functionality for the web.
class GMapsAutocompleteWeb extends GMapsAutocompletePlatform {
  /// Registers this class as the default instance of [GMapsAutocompletePlatform].
  static void registerWith(Registrar registrar) {
    GMapsAutocompletePlatform.instance = GMapsAutocompleteWeb();
  }

  @override
  Widget buildView() {
    return const GMapsAutocompleteWidget();
  }
}

class GMapsAutocompleteWidget extends StatefulWidget {
  const GMapsAutocompleteWidget();

  @override
  _GMapsAutocompleteWidget createState() => _GMapsAutocompleteWidget();
}

class _GMapsAutocompleteWidget extends State<GMapsAutocompleteWidget> {
  @override
  void initState() {
    ui.platformViewRegistry.registerViewFactory(
        'gmaps-autocomplete',
        (int viewId) => html.InputElement()
          ..id = 'gmaps-autocomplete-input'
          ..placeholder = 'Please enter your address');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(
      viewType: 'gmaps-autocomplete',
    );
  }
}
