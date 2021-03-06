import 'dart:io';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String? address;

  const PlaceLocation(
      {required this.latitude, required this.longitude, this.address});
}

class Place {
  final String title;
  final String id;
  final PlaceLocation? location;
  final File image;

  Place(
      {required this.title,
      required this.id,
      this.location,
      required this.image});
}
