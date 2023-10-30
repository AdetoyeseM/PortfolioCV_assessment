import 'package:flutter/cupertino.dart';
import 'package:portfolio_cv_assessment/views/constants/colors/colors.dart';

TextStyle appTextStyle(
        {double? fontSize,
        Color? color,
        String? fontfamily,
        FontWeight? fontWeight,
        TextOverflow? overflow}) =>
    TextStyle(
        overflow: overflow,
        fontSize: fontSize ?? 18,
        color: color ?? PorfolioColorsDark.black,
        fontFamily: fontfamily ?? 'Inter',
        fontWeight: fontWeight ?? FontWeight.w600);
