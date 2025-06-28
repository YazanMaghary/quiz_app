import 'package:flutter/material.dart';
import 'package:team_quiz_app/modules/level.dart';
import 'package:team_quiz_app/view/pages/level_describtion.dart';
import 'package:team_quiz_app/view/widgets/fade_builder.dart';
import '../../view/pages/home.dart';
import '../../view/pages/questions/brain/quiz_brain.dart';
import '../../view/pages/questions/qestion_screen.dart';
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
