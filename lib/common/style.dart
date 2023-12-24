import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorApp {
  /// Main
  static const primary = Color.fromRGBO(6, 193, 73, 1);
  static const secondary = Color.fromRGBO(255, 211, 0, 1);

  /// alert & status
  static const success = Color.fromRGBO(6, 193, 73, 1);
  static const warning = Color.fromRGBO(250, 204, 21, 1);
  static const error = Color.fromRGBO(247, 85, 85, 1);
  static const disable = Color.fromRGBO(216, 216, 216, 1);
  static const buttonDisable = Color.fromRGBO(14, 158, 66, 1);
  static const white = Color.fromRGBO(255, 255, 255, 1);
}

final myTextTheme = TextTheme(
  displayLarge: GoogleFonts.urbanist(
      fontSize: 93, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  displayMedium: GoogleFonts.urbanist(
      fontSize: 58, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  displaySmall: GoogleFonts.urbanist(fontSize: 47, fontWeight: FontWeight.w400),
  headlineMedium: GoogleFonts.urbanist(
      fontSize: 33, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headlineSmall:
      GoogleFonts.urbanist(fontSize: 23, fontWeight: FontWeight.w400),
  titleLarge: GoogleFonts.urbanist(
      fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  titleMedium: GoogleFonts.urbanist(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  titleSmall: GoogleFonts.urbanist(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyLarge: GoogleFonts.urbanist(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyMedium: GoogleFonts.urbanist(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  labelLarge: GoogleFonts.urbanist(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  bodySmall: GoogleFonts.urbanist(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  labelSmall: GoogleFonts.urbanist(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);
