import 'package:flutter/material.dart';
import '../models/promo.dart';

class PromoBannerWidget extends StatelessWidget {
  final Promo promo;
  const PromoBannerWidget({required this.promo, super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(promo.imageAsset),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.25), Colors.transparent],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),
          Positioned(
            left: 14,
            top: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 247, 85, 85),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                promo.subtitle,
                style: TextStyle(color: Colors.white.withOpacity(0.95), fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            left: 14,
            bottom: 12,
            child: Text(
              promo.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          )
        ],
      ),
    );
  }
}
