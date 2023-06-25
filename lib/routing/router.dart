import 'package:flutter/material.dart';
import 'package:team_quiz_app/modules/level.dart';
import 'package:team_quiz_app/pages/level_describtion.dart';
import 'package:team_quiz_app/pages/multipe_choice/quiz_brain_multiple.dart';
import 'package:team_quiz_app/shared/widgets/fade_builder.dart';

import '../pages/home.dart';
import '../pages/multipe_choice/multiple_q_screen.dart';
import '../pages/true_false/true_false_q_screen.dart';
import 'routes.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  String? routeName = settings.name;
  switch (routeName) {
    case Routes.homePage:
      return FadeBuilder(const HomePage());
    case Routes.trueOrFalse:
      return FadeBuilder(const TrueFalseQuiz());
    case Routes.multiple:
    QuizBrainMulti quizBrain=settings.arguments as QuizBrainMulti;
      return FadeBuilder( MultiQScreen(quizBrain: quizBrain,));
    case Routes.levelDescription:
      Level level = settings.arguments as Level;
      return FadeBuilder(LevelDescription(level));
    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
