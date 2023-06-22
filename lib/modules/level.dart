import 'package:flutter/material.dart';

class Level{

  final IconData icon;
  final String title;
  final String subtitle;
  final String image;
  final List<Color> colors;

  const Level({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.colors,
  }) ;
}