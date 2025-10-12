import 'package:flutter/material.dart';
import 'app_typography.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    // Set default family ke Sora juga (backup untuk komponen bawaan)
    fontFamily: 'Sora',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme().apply( // biarkan kosong, kita pakai extension
      displayColor: Colors.black,
      bodyColor: Colors.black,
    ),

    // Komponen-komponen utama ikut font kita
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: 'Sora', fontWeight: FontWeight.w600, fontSize: 16, height: 1.5,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(
        fontFamily: 'Sora', fontWeight: FontWeight.w400, fontSize: 14, height: 1.5,
      ).copyWith(color: Colors.white.withOpacity(0.6)),
    ),

    // Tambahkan token tipografi kita
    extensions: <ThemeExtension<dynamic>>[
      AppTypography.sora(Colors.black), // untuk layar terang
    ],
  );

  static ThemeData dark = light.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    extensions: <ThemeExtension<dynamic>>[
      AppTypography.sora(Colors.white), // untuk teks di header gelap
    ],
  );
}
