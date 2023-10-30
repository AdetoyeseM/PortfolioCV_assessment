import 'package:flutter/material.dart';
import 'package:portfolio_cv_assessment/views/constants/text_decorations/text_decoration.dart';
import '../constants/colors/colors.dart';

class AppThemeData {
  ThemeData darkAppTheme = ThemeData(
    disabledColor: PorfolioColorsDark.backgroundColor.withOpacity(.15),
    primaryColor: const Color(0xff030108),
    dividerColor: const Color(0xff2D1F3B),
    primaryColorLight: PorfolioColorsDark.white.withOpacity(.7),
    textTheme: _textTheme,
    fontFamily: "Poppins",
    scaffoldBackgroundColor: PorfolioColorsDark.backgroundColor,
    inputDecorationTheme: darkInputDecorationTheme,
    canvasColor: PorfolioColorsDark.backgroundColor,
    highlightColor: PorfolioColorsDark.white,
    primaryIconTheme: darkIconTheme,
    indicatorColor: const Color(0xff3A284C),
    colorScheme: ThemeData.dark()
        .colorScheme
        .copyWith(
            primary: PorfolioColorsDark.backgroundColor,
            secondary: PorfolioColorsDark.blue_800)
        .copyWith(background: PorfolioColorsDark.black),
  );
}

UnderlineInputBorder underlineInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(
  color: PorfolioColorsDark.backgroundColor,
));

UnderlineInputBorder focusedErrorBorder =
    const UnderlineInputBorder(borderSide: BorderSide(color: Colors.red));

UnderlineInputBorder focusedInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(
  width: 1,
  color: PorfolioColorsDark.backgroundColor,
));

InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    border: underlineInputBorder,
    focusedErrorBorder: underlineInputBorder,
    focusedBorder: focusedInputBorder,
    errorBorder: underlineInputBorder,
    filled: false,
    enabledBorder: underlineInputBorder,
    contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    hintStyle: const TextStyle(
        color: Color(0xff6C757D), fontWeight: FontWeight.w400, fontSize: 15));

TextTheme _textTheme = TextTheme(
    titleLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 7,
        color: PorfolioColorsDark.white,
        fontWeight: FontWeight.w600));
IconThemeData darkIconTheme = IconThemeData(
  color: PorfolioColorsDark.white,
);
IconThemeData darkAccentIconTheme = IconThemeData(
  color: PorfolioColorsDark.backgroundColor,
);
