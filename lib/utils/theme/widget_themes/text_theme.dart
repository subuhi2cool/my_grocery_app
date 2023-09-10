import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme{
    static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
      color: Colors.black,
   //  fontWeight: FontWeight.w700,
      fontSize: 30
      ),
      displayMedium: GoogleFonts.montserrat(
      color: Colors.black,
      fontSize: 20,
     // fontWeight: FontWeight.w600,
    ),
      displaySmall: GoogleFonts.montserrat(
        color: Colors.black,
        fontSize: 16,
      // fontWeight: FontWeight.w500,
      ),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(
      color: Colors.white70,
        fontWeight: FontWeight.w700,
      fontSize: 30
    ),
    displayMedium: GoogleFonts.montserrat(
      color: Colors.white60,
      fontSize: 20,
    ),
    displaySmall: GoogleFonts.montserrat(
      color: Colors.white60,
      fontSize: 16,
    ),
  );
}