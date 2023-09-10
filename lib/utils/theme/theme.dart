import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_grocery_app/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:my_grocery_app/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:my_grocery_app/utils/theme/widget_themes/text_form_field_theme.dart';
import 'package:my_grocery_app/utils/theme/widget_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._(); // To avoid creating instances
  static ThemeData lightTheme = ThemeData(
    fontFamily: GoogleFonts.lato().fontFamily,
    primarySwatch: Colors.green,
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: const AppBarTheme(),
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: GoogleFonts.lato().fontFamily,
    primarySwatch: Colors.green,
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    appBarTheme: const AppBarTheme(),
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
  );
}