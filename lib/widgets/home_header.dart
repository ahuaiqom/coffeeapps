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
      Color(0xFF0F0F0F), // 0% - sedikit lebih lembut dari #111111
      Color(0xFF181818), // 40% - transisi lembut
      Color(0xFF1E1C1A), // 75% - warm brownish tone
      Color(0xFF1A1716), // 100% - lembut di bawah
    ],
    stops: [0.0, 0.4, 0.75, 1.0],
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
