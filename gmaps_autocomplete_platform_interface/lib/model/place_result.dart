class PlaceResult {
  const PlaceResult({
    this.addressComponents,
    this.adrAddress,
    // this.aspects,
    // this.businessStatus,
    this.formattedAddress,
    this.formattedPhoneNumber,
    // this.geometry,
    this.htmlAttributions,
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.internationalPhoneNumber,
    this.name,
    // this.openingHours,
    // this.photos,
    this.placeId,
    // this. plusCode,
    this.priceLevel,
    this.ratings,
    // this.reviews,
    this.types,
    this.url,
    this.userRatingsTotal,
    this.utcOffset,
    this.utcOffsetMinutes,
    this.vicinitiy,
    this.website,
  });

  final List<GeocoderAddressComponent>? addressComponents;
  final String? adrAddress;
  // final List<PlaceAspectRating>? aspects;
  // final BusinessStatus? businessStatus;
  final String? formattedAddress;
  final String? formattedPhoneNumber;
  // final PlaceGeometry? geometry;
  final List<String>? htmlAttributions;
  final String? icon;
  final String? iconBackgroundColor;
  final String? iconMaskBaseUri;
  final String? internationalPhoneNumber;
  final String? name;
  // final PlaceOpeningHours? openingHours;
  // final List<PlacePhoto> photos;
  final String? placeId;
  // final PlacePlusCode? plusCode;
  final num? priceLevel;
  final num? ratings;
  // final List<PlaceReview>? reviews;
  final List<String>? types;
  final String? url;
  final num? userRatingsTotal;
  final num? utcOffset;
  final num? utcOffsetMinutes;
  final String? vicinitiy;
  final String? website;
}

class GeocoderAddressComponent {
  const GeocoderAddressComponent({
    required this.longName,
    required this.shortName,
    required this.types,
  });

  final String longName;
  final String shortName;
  final List<String> types;
}
