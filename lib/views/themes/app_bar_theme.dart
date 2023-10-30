import 'package:flutter/material.dart';
import '../constants/colors/colors.dart';

class PrimaryOfferAppBarThemeLight {
  static AppBarTheme darkAppBarTheme = AppBarTheme(
      elevation: 0,
      toolbarHeight: kToolbarHeight,
      backgroundColor: PorfolioColorsDark.black,
      iconTheme: iconThemeData,
      titleSpacing: 1,
      foregroundColor: PorfolioColorsDark.white,
      titleTextStyle:
          const TextStyle(fontWeight: FontWeight.w400, fontSize: 16));

  static IconThemeData iconThemeData = IconThemeData(
    color: PorfolioColorsDark.white,
    size: 24,
  );
}
