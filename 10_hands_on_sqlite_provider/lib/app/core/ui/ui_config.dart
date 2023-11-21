import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UiConfig {
  UiConfig._();

  static ThemeData get theme {
    return ThemeData(
      textTheme: GoogleFonts.mandaliTextTheme(),
      primarySwatch: Colors.teal,
      primaryColor: Colors.teal,
      primaryColorLight: const Color(0XFFb4cec8),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal.shade200,
        ),
      ),
    );
  }
}
