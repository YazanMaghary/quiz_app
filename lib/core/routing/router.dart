import 'package:flutter/material.dart';
import 'package:team_quiz_app/modules/level.dart';
import 'package:team_quiz_app/pages/level_describtion.dart';
import 'package:team_quiz_app/core/shared/widgets/fade_builder.dart';
import '../../pages/home.dart';
import '../../pages/questions/brain/quiz_brain.dart';
import '../../pages/questions/qestion_screen.dart';
import 'routes.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  String? routeName = settings.name;
  switch (routeName) {
    case Routes.homePage:
      return FadeBuilder(const HomePage());

    case Routes.question:
      QuizBrain quizBrain = settings.arguments as QuizBrain;
      return FadeBuilder(QuestionScreen(
        quizBrain: quizBrain,
      ));
    case Routes.levelDescription:
      Level level = settings.arguments as Level;
      return FadeBuilder(LevelDescription(level));
    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
