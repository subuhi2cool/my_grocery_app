import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._(); // To avoid creating instances

// LIGHT THEME
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11.0)),
        foregroundColor: tWhiteColor,
        backgroundColor: tPrimaryColor,
        side: const BorderSide(color: tPrimaryColor),
        padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
      ),
  );

//DARK THEME
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11.0)),
        foregroundColor: tSecondaryColor,
        backgroundColor: tWhiteColor,
        side: const BorderSide(color: tWhiteColor),
        padding: const EdgeInsets.symmetric(vertical: tButtonHeight),
      )
  );

}