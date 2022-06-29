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
  LatLng? _pickedLocation;
  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Map'),
        actions: [
          if (widget.isSelecting!)
            IconButton(
              onPressed: (_pickedLocation == null)
                  ? null
                  : () {
                      Navigator.of(context).pop(_pickedLocation);
                    },
              icon: const Icon(
                Icons.check,
              ),
            ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.intialLocation!.latitude,
            widget.intialLocation!.longitude,
          ),
          zoom: 16,
        ),
        onTap: widget.isSelecting! ? _selectLocation : null,
        markers: (_pickedLocation == null && widget.isSelecting!)
            ? {}
            : {
                Marker(
                  markerId: const MarkerId('m1'),
                  position: _pickedLocation ??
                      LatLng(
                        widget.intialLocation!.latitude,
                        widget.intialLocation!.longitude,
                      ),
                ),
              },
      ),
    );
  }
}
