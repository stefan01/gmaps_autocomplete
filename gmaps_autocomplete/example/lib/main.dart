import 'package:flutter/material.dart';
import 'package:gmaps_autocomplete/gmaps_autocomplete.dart';

void main() {
  runApp(const GMapsAutocompleteExample());
}

class GMapsAutocompleteExample extends StatelessWidget {
  const GMapsAutocompleteExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: GMapsAutocomplete(),
      ),
    );
  }
}
