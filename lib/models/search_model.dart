import 'package:flutter/foundation.dart';

import 'model.dart';

class SearchModel extends ChangeNotifier {
  String _searchString = '';

  String get searchString => _searchString;

  List<Show> _shows = [];

  List<Show> get shows => _shows;

  void updateSearchString(String newString) {
    _searchString = newString;
    notifyListeners(); // Notify listeners about the change
  }

  void updateSearchShows(List<Show> shows) {
    _shows = shows;
    notifyListeners(); // Notify listeners about the change
  }
}