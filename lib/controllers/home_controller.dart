import 'package:flutter/material.dart';
import '../data/coffee_data.dart';

class HomeController extends ChangeNotifier {
  String selectedCategory = 'all';
  String location = 'Bilzen, Tanjungbalai';

  void selectCategory(String categoryId) {
    selectedCategory = categoryId;
    notifyListeners();
  }

  List get coffeesFiltered {
    if (selectedCategory == 'all') return coffees;
    return coffees.where((c) => c.category == selectedCategory).toList();
  }
}
