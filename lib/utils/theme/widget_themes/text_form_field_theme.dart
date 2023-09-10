import 'package:flutter/material.dart';

import '../../../constants/colors.dart';


class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
       InputDecorationTheme(
        border: const OutlineInputBorder(),
        prefixIconColor: tSecondaryColor,
        floatingLabelStyle: const TextStyle(color: tSecondaryColor),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2,color: Colors.black26),
          borderRadius: BorderRadius.circular(11),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: const BorderSide(width: 2,color: tPrimaryColor),
        ));

  static InputDecorationTheme darkInputDecorationTheme =
     InputDecorationTheme(
      border: const OutlineInputBorder(),
      prefixIconColor: tPrimaryColor,
      floatingLabelStyle: const TextStyle(color: tPrimaryColor),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11),
        borderSide: const BorderSide(width: 2,color: tWhiteColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(11),
        borderSide: const BorderSide(width: 2,color: tPrimaryColor),
      ));
}