import 'package:flutter/material.dart';
import 'dart:io';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File pickedImage) {
    _items.add(Place(
        id: DateTime.now().toString(),
        title: title,
        location: null, // todo
        image: pickedImage));
    notifyListeners();
  }
}
