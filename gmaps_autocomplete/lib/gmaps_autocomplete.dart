import 'package:flutter/widgets.dart';

import 'package:gmaps_autocomplete_platform_interface/gmaps_autocomplete_platform_interface.dart';

class GMapsAutocomplete extends StatelessWidget {
  const GMapsAutocomplete();

  @override
  Widget build(BuildContext context) {
    return GMapsAutocompletePlatform.instance.buildView();
  }
}
