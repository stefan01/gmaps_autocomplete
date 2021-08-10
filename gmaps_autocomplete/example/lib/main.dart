import 'package:flutter/material.dart';
import 'package:gmaps_autocomplete/gmaps_autocomplete.dart';

void main() {
  runApp(const GMapsAutocompleteExample());
}

class GMapsAutocompleteExample extends StatelessWidget {
  const GMapsAutocompleteExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GMaps Autocomplete Example'),
        ),
        body: Column(
          children: const <Widget>[
            Text('Address'),
            SizedBox(
              height: 25,
              width: 200,
              child: GMapsAutocomplete(),
            ),
          ],
        ),
      ),
    );
  }
}
