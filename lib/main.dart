import 'package:flutter/material.dart';
import 'package:places_app/Providers/great_places.dart';
import 'package:places_app/screens/add_place_screen.dart';
import 'package:places_app/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => GreatPlaces(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: Colors.blue,
                secondary: Colors.amber,
              ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              onPrimary: Colors.white,
              primary: Colors.amber,
            ),
          ),
        ),
        home: const PlacesListScreen(),
        routes: {AddPlaceScreen.routeName: (ctx) => const AddPlaceScreen()},
      ),
    );
  }
}
