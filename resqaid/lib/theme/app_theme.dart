import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resqaid/theme/appColors.dart';

class AppTheme {
  ThemeData get light => _base(LightColor());

  ThemeData _base(AppColors color) {
    return ThemeData(
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: color.primary,
        foregroundColor: color.accent,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: color.white,
        elevation: 2,
      ),
      // TextEditingController
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: color.primary),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color.primary),
        ),
      ),
      // default
      primaryTextTheme: TextTheme(
        labelLarge: GoogleFonts.raleway(
          fontSize: 24,
          color: color.primary,
          fontWeight: FontWeight.w600,
        ),
        labelMedium: GoogleFonts.raleway(
          fontSize: 20,
          color: color.primary,
          fontWeight: FontWeight.w600,
        ),
        labelSmall: GoogleFonts.raleway(
          fontSize: 14,
          color: color.richBlack,
          fontWeight: FontWeight.w500,
        ),
      ),
      textTheme: TextTheme(
        // heading
        displayLarge: GoogleFonts.alegreyaSans(
          fontSize: 36,
          color: color.primary,
          shadows: [
            const Shadow(
              color: Colors.grey,
              offset: Offset(1, 1),
              blurRadius: 2,
            ),
          ],
          fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.alegreyaSans(
          fontSize: 32,
          color: color.primary,
          shadows: [
            const Shadow(
              color: Colors.grey,
              offset: Offset(1, 1),
              blurRadius: 2,
            ),
          ],
          fontWeight: FontWeight.bold,
        ),
        displaySmall: GoogleFonts.alegreyaSans(
          fontSize: 28,
          color: color.primary,
          fontWeight: FontWeight.bold,
        ),
        // title
        titleLarge: GoogleFonts.robotoSlab(
          fontSize: 24,
          color: color.primary,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.1,
        ),
        titleMedium: GoogleFonts.robotoSlab(
          fontSize: 20,
          color: color.primary,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.1,
        ),
        titleSmall: GoogleFonts.robotoSlab(
          fontSize: 16,
          color: color.primary,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.1,
        ),
        // description
        bodyLarge: GoogleFonts.publicSans(
          fontSize: 18,
          color: color.richBlack,
        ),
      ),
      useMaterial3: true,
      extensions: [color],
      scaffoldBackgroundColor: color.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(color.primary),
          foregroundColor: WidgetStatePropertyAll(color.white),
          textStyle: WidgetStateProperty.all(
            const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
