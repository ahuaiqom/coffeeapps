import 'package:flutter/material.dart';
import '../models/coffee.dart';

class CoffeeCard extends StatelessWidget {
  final Coffee coffee;
  final VoidCallback? onTap;

  const CoffeeCard({super.key, required this.coffee, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'coffee-hero-${coffee.name}',
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(coffee.image, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(coffee.name, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text(coffee.type, style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('⭐ ${coffee.rating.toStringAsFixed(1)}'),
                      const SizedBox(width: 8),
                      Text('(${coffee.reviews})',
                          style: Theme.of(context).textTheme.bodySmall),
                      const Spacer(),
                      // ⬇️ harga dari coffee_data.dart, format dolar
                      Text(
                        '\$ ${coffee.price.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
