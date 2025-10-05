import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/home_controller.dart';
import '../widgets/coffee_card.dart';

class CoffeeGridWidget extends StatelessWidget {
  const CoffeeGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, controller, _) {
        final coffees = controller.coffeesFiltered;
        return Expanded(
          child: GridView.builder(
            itemCount: coffees.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.68,
            ),
            itemBuilder: (context, index) =>
                CoffeeCard(coffee: coffees[index]),
          ),
        );
      },
    );
  }
}
