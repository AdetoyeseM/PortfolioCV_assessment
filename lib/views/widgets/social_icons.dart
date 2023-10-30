import 'package:flutter/material.dart';
import 'package:portfolio_cv_assessment/views/constants/colors/colors.dart';

class SocialICons extends StatelessWidget {
  const SocialICons({super.key, this.icon, this.onTap});

  final VoidCallback? onTap;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 25),
        child: Icon(
          icon,
          color: PorfolioColorsDark.white,
        ),
      ),
    );
  }
}
