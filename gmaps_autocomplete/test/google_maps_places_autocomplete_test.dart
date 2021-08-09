import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_places_autocomplete/google_maps_places_autocomplete.dart';

void main() {
  const MethodChannel channel = MethodChannel('google_maps_places_autocomplete');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await GoogleMapsPlacesAutocomplete.platformVersion, '42');
  });
}
