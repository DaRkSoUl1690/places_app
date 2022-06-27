// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:places_app/models/place.dart';

class MapScreen extends StatefulWidget {
  PlaceLocation? intialLocation;
  bool? isSelecting;

  MapScreen({
    Key? key,
    this.intialLocation = const PlaceLocation(
      latitude: 37,
      longitude: 77,
    ),
    this.isSelecting = false,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.intialLocation!.latitude,
            widget.intialLocation!.longitude,
          ),
          zoom: 16,
        ),
      ),
    );
  }
}
