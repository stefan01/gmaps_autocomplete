import 'package:flutter/material.dart';
import 'package:gmaps_autocomplete/gmaps_autocomplete.dart';
import 'package:gmaps_autocomplete_platform_interface/model/lat_lng_bounds.dart';
import 'package:gmaps_autocomplete_platform_interface/model/lat_lng.dart';
import 'package:gmaps_autocomplete_platform_interface/model/place_result.dart';

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
          children: <Widget>[
            const Text('Address'),
            SizedBox(
              height: 25,
              width: 200,
              child: GMapsAutocomplete(
                onSubmitted: (PlaceResult result) {
                  print('PLACEID: ${result.placeId}');
                },
                bounds: const LatLngBounds(
                  northeast: LatLng(50.164192, -130.705469),
                  southwest: LatLng(49.964192, -130.505469),
                ),
                fields: const <String>[
                  'address_components',
                  'geometry',
                  'icon',
                  'name',
                  'place_id'
                ],
                strictBounds: false,
                types: const <String>['establishment'],
                componentRestrictions: const <String>['us'],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
