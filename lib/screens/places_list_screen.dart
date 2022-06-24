import 'package:flutter/material.dart';
import 'package:places_app/Providers/great_places.dart';
import 'package:places_app/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatefulWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  State<PlacesListScreen> createState() => _PlacesListScreenState();
}

class _PlacesListScreenState extends State<PlacesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        builder: (ctx, greatPlaces, Widget? ch) => greatPlaces.items.isNotEmpty
            ? ListView.builder(
                itemCount: greatPlaces.items.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      greatPlaces.items[index].image,
                    ),
                  ),
                  title: Text(greatPlaces.items[index].title),
                  onTap: () {},
                ),
              )
            : const Center(
                child: Text(
                  'Got no places yet,start adding some!',
                  style: TextStyle(color: Colors.black),
                ),
              ),
      ),
    );
  }
}
