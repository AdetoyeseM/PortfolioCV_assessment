import 'package:flutter/material.dart';
import '../constants/colors/colors.dart';

class PrimaryOfferInputThemeLight {
  static OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
      gapPadding: 15,
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide.none);

  static OutlineInputBorder focusedInputBorder = OutlineInputBorder(
      gapPadding: 15,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(width: 1, color: PorfolioColorsDark.blue_300));

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
      border: outlineInputBorder,
      focusedErrorBorder: outlineInputBorder,
      focusedBorder: focusedInputBorder,
      errorBorder: outlineInputBorder,
      filled: true,
      enabledBorder: outlineInputBorder,
      contentPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      fillColor: PorfolioColorsDark.white_300,
      hintStyle: TextStyle(
          fontFamily: 'Inter',
          color: PorfolioColorsDark.black.withOpacity(0.7),
          fontWeight: FontWeight.w600,
          fontSize: 15));
}
