import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/home_controller.dart';
import 'coffee_card.dart';

class CoffeeGridWidget extends StatelessWidget {
  const CoffeeGridWidget({
    super.key,
    this.bottomPadding = 24, // <- tambahkan parameter
  });

  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, controller, _) {
        final coffees = controller.coffeesFiltered;

        return GridView.builder(
          itemCount: coffees.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(), // ikut scroll parent
          padding: EdgeInsets.only(bottom: bottomPadding), // <- dipakai di sini
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.68,
          ),
          itemBuilder: (context, index) => CoffeeCard(coffee: coffees[index]),
        );
      },
    );
  }
}
