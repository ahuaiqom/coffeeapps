import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/home_controller.dart';
import '../widgets/home_header.dart';
import '../widgets/search_bar.dart';
import '../widgets/promo_banner.dart';
import '../widgets/category_filter.dart';
import '../widgets/coffee_grid.dart';
import '../widgets/bottom_navbar.dart';
import '../models/promo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              const HomeHeader(location: 'East Java, Malang'),
              const SearchBarWidget(),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16, vertical: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PromoBannerWidget(
                          promo: Promo(
                            title: "Buy one get one FREE",
                            subtitle: "Promo",
                            imageAsset: "assets/image/Banner2.jpg",
                          ),
                        ),
                        SizedBox(height: 12),
                        CategoryFilterWidget(),
                        SizedBox(height: 12),
                        CoffeeGridWidget(),
                        SizedBox(height: 8),
                        BottomNavBar(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}