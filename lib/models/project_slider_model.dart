import 'package:flutter/material.dart';

class ProjectSliderModel {
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback? onTap;

  ProjectSliderModel(
      {required this.title,
      required this.onTap,
      required this.description,
      required this.imageUrl});
}
