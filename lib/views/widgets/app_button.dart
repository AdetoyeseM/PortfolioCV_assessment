import 'package:flutter/material.dart';
import 'package:portfolio_cv_assessment/views/constants/colors/colors.dart';
import 'package:portfolio_cv_assessment/views/constants/text_decorations/text_decoration.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.height,
      this.backgroundColor,
      this.textColor,
      this.widget,
      this.text,
      this.onTap,
      this.enabled = true})
      : super(key: key);

  final String? text;
  final VoidCallback? onTap;
  final double? height;
  final Color? textColor, backgroundColor;
  final bool? enabled;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ?? false ? onTap : () {},
      child: Container(
        height: height ?? 55,
        decoration: BoxDecoration(
          color: backgroundColor ??
              (enabled ?? false
                  ? PorfolioColorsDark.blue_800
                  : PorfolioColorsDark.grey_700),
          border: Border.all(
              color: backgroundColor ??
                  (enabled ?? false
                      ? PorfolioColorsDark.blue_800
                      : PorfolioColorsDark.grey_700)),
          borderRadius: BorderRadius.circular(height ?? 8),
        ),
        child: widget ??
            Center(
              child: Text(
                text ?? "Continue",
                style: appTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: textColor ?? PorfolioColorsDark.white),
              ),
            ),
      ),
    );
  }
}
