import 'package:flutter/material.dart';

import '../pages/home.dart';
import '../pages/multiple_q_screen.dart';
import '../pages/true_false_q_screen.dart';

class FadeRouteBuilder2 extends PageRouteBuilder {
  final String routeName;

  FadeRouteBuilder2({required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            Widget pageWidget;
            switch (routeName) {
              case 'HomePage':
                pageWidget = const HomePage();
                break;
              case 'level1':
                pageWidget = const TrueFalseQuiz();
                break;
              case 'level2':
                pageWidget = const MultiQScreen();
                break;
              // Add more cases for additional pages if needed
              default:
                pageWidget = Container();
            }
            return pageWidget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
