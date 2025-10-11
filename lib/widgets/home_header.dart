import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
      Color(0xFF111111), // 0%
      Color(0xFF1B1B1B), // 55%
      Color(0xFF212121), // 80%
      Color(0xFF1A1A1A), // 100%
    ],
    stops: [0.0, 0.55, 0.80, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.only(top: 20, bottom: 12),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "At your Service, Ahua",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
