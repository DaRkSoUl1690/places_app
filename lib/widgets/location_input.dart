import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:places_app/helpers/location_helper.dart';

class LocationInput extends StatefulWidget {
  LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  late String _previewImageUrl = "";

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    debugPrint(locData.latitude.toString());
    debugPrint(locData.longitude.toString());
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
      latitude: locData.latitude!,
      longitude: locData.longitude!,
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 170,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _previewImageUrl == ""
              ? const Text(
                  "No Location Chosen",
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  "https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.location_on),
              label: const Text("Current Location"),
              onPressed: _getCurrentUserLocation,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.map),
              label: const Text("Select on Map"),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
