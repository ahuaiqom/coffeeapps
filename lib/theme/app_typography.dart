import 'package:flutter/material.dart';

/// Token tipografi sesuai Figma (Sora, line-height ~150%, letterSpacing 0)
class AppTypography extends ThemeExtension<AppTypography> {
  final TextStyle titleL;   // contoh: 20/SemiBold
  final TextStyle labelM;   // contoh: 14/SemiBold
  final TextStyle bodyM;    // contoh: 14/Regular
  final TextStyle bodyS;    // contoh: 12/Regular

  const AppTypography({
    required this.titleL,
    required this.labelM,
    required this.bodyM,
    required this.bodyS,
  });

  factory AppTypography.sora(Color color) {
    const family = 'Sora';
    return AppTypography(
      titleL: const TextStyle(
        fontFamily: family, fontSize: 20, fontWeight: FontWeight.w600, height: 1.5, letterSpacing: 0.0,
      ).copyWith(color: color),
      labelM: const TextStyle(
        fontFamily: family, fontSize: 14, fontWeight: FontWeight.w600, height: 1.5, letterSpacing: 0.0,
      ).copyWith(color: color),
      bodyM: const TextStyle(
        fontFamily: family, fontSize: 14, fontWeight: FontWeight.w400, height: 1.5, letterSpacing: 0.0,
      ).copyWith(color: color),
      bodyS: const TextStyle(
        fontFamily: family, fontSize: 12, fontWeight: FontWeight.w400, height: 1.5, letterSpacing: 0.0,
      ).copyWith(color: color),
    );
  }

  @override
  AppTypography copyWith({TextStyle? titleL, labelM, bodyM, bodyS}) {
    return AppTypography(
      titleL: titleL ?? this.titleL,
      labelM: labelM ?? this.labelM,
      bodyM: bodyM ?? this.bodyM,
      bodyS: bodyS ?? this.bodyS,
    );
  }

  @override
  AppTypography lerp(ThemeExtension<AppTypography>? other, double t) {
    if (other is! AppTypography) return this;
    return AppTypography(
      titleL: TextStyle.lerp(titleL, other.titleL, t)!,
      labelM: TextStyle.lerp(labelM, other.labelM, t)!,
      bodyM: TextStyle.lerp(bodyM, other.bodyM, t)!,
      bodyS: TextStyle.lerp(bodyS, other.bodyS, t)!,
    );
    }
}
