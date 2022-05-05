import 'dart:html';
import 'dart:html' as html;
import 'dart:js';
// import 'dart:io' if (dart.library.html) 'dart:ui' as ui;
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:gmaps_autocomplete_platform_interface/gmaps_autocomplete_platform_interface.dart';
import 'package:gmaps_autocomplete_platform_interface/model/lat_lng_bounds.dart';
import 'package:gmaps_autocomplete_platform_interface/model/place_result.dart';
import 'package:gmaps_autocomplete_web/model/gmaps.dart';
import 'package:gmaps_autocomplete_web/model/gmaps_places.dart';
import 'package:uuid/uuid.dart';

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
    void Function(PlaceResult result)? onSubmitted,
  }) {
    return GMapsAutocompleteWidget(
      fields: fields,
      types: types,
      bounds: bounds,
      strictBounds: strictBounds,
      componentRestrictions: componentRestrictions,
      onSubmitted: onSubmitted,
    );
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
  final void Function(PlaceResult result)? onSubmitted;

  @override
  _GMapsAutocompleteWidget createState() => _GMapsAutocompleteWidget();
}

/// State for widget displaying an google maps autocomplete text field
class _GMapsAutocompleteWidget extends State<GMapsAutocompleteWidget> {
  MapsEventListener? _eventListener;

  final Uuid uuid = const Uuid();
  late String id;

  @override
  void initState() {
    id = uuid.v4();

    final HtmlElement inputElement = html.InputElement()
      ..id = 'gmaps-autocomplete-input-$id'
      ..placeholder = 'Please enter your address'
      ..type = 'text';

    ui.platformViewRegistry.registerViewFactory(
        'gmaps-autocomplete-$id', (int viewId) => inputElement);

    final LatLngBounds? bounds = widget.bounds;

    final Autocomplete autocomplete = Autocomplete(
      inputElement,
      AutocompleteOptions(
        fields: widget.fields,
        types: widget.types,
        bounds: bounds == null
            ? null
            : LatLngBoundsJS(
                LatLngJS(
                  lat: bounds.northeast.lat,
                  lng: bounds.northeast.lng,
                ),
                LatLngJS(
                  lat: bounds.southwest.lat,
                  lng: bounds.southwest.lng,
                ),
              ),
        strictBounds: widget.strictBounds,
        componentRestrictions: widget.componentRestrictions == null
            ? null
            : ComponentRestrictionsJS(country: widget.componentRestrictions!),
      ),
    );

    // Add listener if [onSubmitted] is not null
    if (widget.onSubmitted != null) {
      _eventListener = autocomplete.addListener(
        'place_changed',
        allowInterop(
          () {
            final PlaceResultJS resultJS = autocomplete.getPlace();
            final PlaceResult result = PlaceResult(
              addressComponents: resultJS.address_components
                  ?.map(
                    (GeocoderAddressComponentJS addressComponent) =>
                        GeocoderAddressComponent(
                      longName: addressComponent.long_name,
                      shortName: addressComponent.short_name,
                      types: addressComponent.types,
                    ),
                  )
                  .toList(),
              adrAddress: resultJS.adr_address,
              // this.aspects: resultJS.aspects,
              // this.businessStatus: resultJS.business_status,
              formattedAddress: resultJS.formatted_address,
              formattedPhoneNumber: resultJS.formatted_phone_number,
              // geometry: resultJS.geometry,
              htmlAttributions: resultJS.html_attributions,
              icon: resultJS.icon,
              iconBackgroundColor: resultJS.icon_background_color,
              iconMaskBaseUri: resultJS.icon_mask_base_uri,
              internationalPhoneNumber: resultJS.international_phone_number,
              name: resultJS.name,
              // openingHours: resultJS.opening_hours,
              // photos: resultJS.photos,
              placeId: resultJS.place_id,
              // plusCode: resultJS.plus_code,
              priceLevel: resultJS.price_level,
              ratings: resultJS.ratings,
              // reviews: resultJS.reviews,
              types: resultJS.types,
              url: resultJS.url,
              userRatingsTotal: resultJS.user_ratings_total,
              utcOffsetMinutes: resultJS.utc_offset_minutes,
              vicinitiy: resultJS.vicinitiy,
              website: resultJS.website,
            );
            widget.onSubmitted!(result);
          },
        ),
      );
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
    return HtmlElementView(
      viewType: 'gmaps-autocomplete-$id',
    );
  }
}
