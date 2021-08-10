import 'dart:html';

import 'package:flutter/widgets.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:gmaps_autocomplete_platform_interface/gmaps_autocomplete_platform_interface.dart';

// import 'dart:io' if (dart.library.html) 'dart:ui' as ui;
import 'dart:ui' as ui;
import 'dart:html' as html;

import 'package:gmaps_autocomplete_web/model/gmaps.dart';

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

/// Widget for displaying an google maps autocomplete text field
class GMapsAutocompleteWidget extends StatefulWidget {
  const GMapsAutocompleteWidget();

  @override
  _GMapsAutocompleteWidget createState() => _GMapsAutocompleteWidget();
}

/// State for widget displaying an google maps autocomplete text field
class _GMapsAutocompleteWidget extends State<GMapsAutocompleteWidget> {
  @override
  void initState() {
    final HtmlElement inputElement = html.InputElement()
      ..id = 'gmaps-autocomplete-input'
      ..placeholder = 'Please enter your address'
      ..type = 'text';

    ui.platformViewRegistry.registerViewFactory(
        'gmaps-autocomplete', (int viewId) => inputElement);

    final Autocomplete autocomplete = Autocomplete(
      inputElement,
      AutocompleteOptions(
        fields: ['address_components', 'geometry', 'icon', 'name'],
        types: ['establishment'],
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(
      viewType: 'gmaps-autocomplete',
    );
  }
}
