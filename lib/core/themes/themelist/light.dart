import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white,
  splashColor: Colors.grey[200],
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
      titleMedium: GoogleFonts.poppins(
          color: Colors.black87, fontSize: 24, fontWeight: FontWeight.w600),
      bodyLarge: GoogleFonts.mulish(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.black87,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      displayLarge: GoogleFonts.mulish(
        color: Colors.black,
        fontSize: 14,
      )),
  iconTheme: IconThemeData(
    color: Colors.black,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
    ),
  ),
);
