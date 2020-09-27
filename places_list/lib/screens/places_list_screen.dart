import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';
import '../screens/add_places_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {
            Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
          }),
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center(
          child: Text('Got no places yet, add new.'),
        ),
        builder: (ctx,greatPlaces, ch) => greatPlaces.items.length <= 0 ? ch : ListView.builder(
          itemCount: greatPlaces.items.length,
          itemBuilder: (ctx, i) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: FileImage(greatPlaces.items[i].image),
              ),
              title: Text(greatPlaces.items[i].title),
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}