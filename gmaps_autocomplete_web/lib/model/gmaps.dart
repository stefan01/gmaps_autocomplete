@JS('google.maps.places')
library maps;

import 'dart:html';
import 'package:js/js.dart';

@JS()
class Autocomplete {
  external Autocomplete(HtmlElement element, AutocompleteOptions options);
}

@JS()
@anonymous
class AutocompleteOptions {
  external factory AutocompleteOptions({
    List<String> fields,
    List<String> types,
  });

  external List<String> fields;
  external List<String> types;
}
