import 'package:flutter/material.dart';
import 'package:team_quiz_app/pages/home.dart';
import 'package:team_quiz_app/pages/level_describtion.dart';
import 'package:team_quiz_app/pages/multiple_q_screen.dart';
import 'package:team_quiz_app/pages/true_false_q_screen.dart';

import 'pages/multiple_q_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        '/': (context) => const HomePage(),
        'level1': (context) => const TrueFalseQuiz(),
        'level2': (context) => const MultiQScreen(),
      },
      initialRoute: '/',
    );
  }
}
