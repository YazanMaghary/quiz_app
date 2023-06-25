import 'package:flutter/material.dart';
import 'package:team_quiz_app/pages/multipe_choice/quiz_brain_multiple.dart';

class Level {
  final IconData icon;
  final String title;
  final String subtitle;
  final String image;
  final List<Color> colors;
  final String route;
  final QuizBrainMulti quizBrain;

  const Level({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.colors,
    required this.route,
    required this.quizBrain
  });
}
