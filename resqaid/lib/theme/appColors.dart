import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color primary;
  final Color navyBlue;
  final Color mateYellow;
  final Color accent;
  final Color white;
  final Color richBlack;
  final Color success;
  final Color error;

  AppColors({
    required this.primary,
    required this.navyBlue,
    required this.mateYellow,
    required this.accent,
    required this.white,
    required this.richBlack,
    required this.success,
    required this.error,
  });

  @override
  ThemeExtension<AppColors> copyWith() => this;

  @override
  ThemeExtension<AppColors> lerp(
          covariant ThemeExtension<AppColors>? other, double t) =>
      this;
}

class LightColor extends AppColors {
  LightColor()
      : super(
          primary: const Color(0xFF2E8B57),
          navyBlue: const Color(0xFF062B47),
          mateYellow: const Color(0xffFBE282),
          accent: const Color(0xFFF2FCF5),
          white: const Color(0xFFFFFFFF),
          richBlack: const Color(0xFF010B13),
          success: const Color(0xFF0F8A3C),
          error: const Color(0xFFD64C3E),
        );
}
