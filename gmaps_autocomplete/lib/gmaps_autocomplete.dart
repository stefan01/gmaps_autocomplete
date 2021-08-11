import 'package:flutter/widgets.dart';

import 'package:gmaps_autocomplete_platform_interface/gmaps_autocomplete_platform_interface.dart';
import 'package:gmaps_autocomplete_platform_interface/model/lat_lng_bounds.dart';
import 'package:gmaps_autocomplete_platform_interface/model/place_result.dart';

class GMapsAutocomplete extends StatelessWidget {
  const GMapsAutocomplete({
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
  Widget build(BuildContext context) {
    return GMapsAutocompletePlatform.instance.buildView(
      fields: fields,
      types: types,
      bounds: bounds,
      strictBounds: strictBounds,
      componentRestrictions: componentRestrictions,
      onSubmitted: onSubmitted,
    );
  }
}
