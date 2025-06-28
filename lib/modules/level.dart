import 'package:flutter/material.dart';

import '../view/pages/questions/brain/quiz_brain.dart';

class Level {
  final IconData icon;
  final String title;
  final String subtitle;
  final String image;
  final List<Color> colors;
  final String route;
  final QuizBrain quizBrain;

  const Level(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.image,
      required this.colors,
      required this.route,
      required this.quizBrain});
}
