import 'dart:html';
import 'dart:html' as html;
// import 'dart:io' if (dart.library.html) 'dart:ui' as ui;
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:gmaps_autocomplete_platform_interface/gmaps_autocomplete_platform_interface.dart';
import 'package:gmaps_autocomplete_platform_interface/model/lat_lng_bounds.dart';
import 'package:gmaps_autocomplete_web/model/gmaps.dart';

import 'package:gmaps_autocomplete_web/model/gmaps_places.dart';

/// The web implementation of [GMapsAutocompletePlatform].
///
/// This class implements the `package:gmaps_autocomplete` functionality for the web.
class GMapsAutocompleteWeb extends GMapsAutocompletePlatform {
  /// Registers this class as the default instance of [GMapsAutocompletePlatform].
  static void registerWith(Registrar registrar) {
    GMapsAutocompletePlatform.instance = GMapsAutocompleteWeb();
  }

  @override
  Widget buildView({
    List<String>? fields,
    List<String>? types,
    LatLngBounds? bounds,
    bool? strictBounds,
    List<String>? componentRestrictions,
    void Function(String placeId)? onSubmitted,
  }) {
    return const GMapsAutocompleteWidget();
  }
}

/// Widget for displaying an google maps autocomplete text field
class GMapsAutocompleteWidget extends StatefulWidget {
  const GMapsAutocompleteWidget({
    this.fields,
    this.types,
    this.bounds,
    this.strictBounds,
    this.componentRestrictions,
    this.onSubmitted,
  });

  final List<String>? fields;
  final List<String>? types;
  final LatLngBounds? bounds;
  final bool? strictBounds;
  final List<String>? componentRestrictions;
  final void Function(String placeId)? onSubmitted;

  @override
  _GMapsAutocompleteWidget createState() => _GMapsAutocompleteWidget();
}

/// State for widget displaying an google maps autocomplete text field
class _GMapsAutocompleteWidget extends State<GMapsAutocompleteWidget> {
  MapsEventListener? _eventListener;

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
        fields: widget.fields,
        types: widget.types,
        bounds: widget.bounds == null
            ? null
            : LatLngBoundsJS.fromLatLngBounds(widget.bounds!),
        strictBounds: widget.strictBounds,
        componentRestrictions: widget.componentRestrictions == null
            ? null
            : ComponentRestrictionsJS.fromStringList(
                widget.componentRestrictions!),
        onSubmitted: widget.onSubmitted,
      ),
    );

    if (widget.onSubmitted != null) {
      _eventListener =
          autocomplete.addListener('place_changed', widget.onSubmitted!);
    }

    super.initState();
  }

  @override
  void dispose() {
    _eventListener?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const HtmlElementView(
      viewType: 'gmaps-autocomplete',
    );
  }
}
