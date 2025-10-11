import 'package:flutter/material.dart';
import '../models/promo.dart';
import '../models/coffee.dart';
import '../models/category.dart';
import '../data/coffee_data.dart' as data; // pakai data dummy yang sudah ada

class HomeController extends ChangeNotifier {
  // === State untuk header & promo (dari langkah sebelumnya) ===
  String location = 'East Java, Malang';
  Promo promo = const Promo(
    title: "Buy one get one FREE",
    subtitle: "Promo",
    imageAsset: "assets/image/Banner2.jpg",
  );

  // === State untuk filter kategori & daftar kopi ===
  String selectedCategory = 'all';

  // Sumber data (sementara dari dummy). Nanti gampang diganti ke Repository/API.
  List<Category> get categories => data.categories;
  List<Coffee> get _allCoffees => data.coffees;

  // List yang sudah difilter oleh kategori (dan nanti bisa ditambah query)
  List<Coffee> get coffeesFiltered {
    if (selectedCategory == 'all') return _allCoffees;
    return _allCoffees.where((c) => c.category == selectedCategory).toList();
  }

  // Actions
  void selectCategory(String categoryId) {
    selectedCategory = categoryId;
    notifyListeners();
  }

  void init() {
    // jika suatu saat perlu fetch async, taruh di sini lalu notifyListeners()
  }
}
