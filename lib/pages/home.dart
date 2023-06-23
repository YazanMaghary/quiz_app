// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:team_quiz_app/constants.dart';
import 'package:team_quiz_app/modules/level.dart';
import 'package:team_quiz_app/pages/multiple_q_screen.dart';
import 'package:team_quiz_app/pages/true_false_q_screen.dart';
import 'package:team_quiz_app/widgets/my_outline_btn.dart';

import '../widgets/my_level_widget.dart';
import 'level_describtion.dart';

class HomePage extends StatefulWidget {
    static const routeName = 'HomePage';

  const HomePage({
    super.key,
  });
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Level> levels = [
    const Level(
        icon: Icons.check,
        title: 'True or False',
        subtitle: 'Level 1',
        image: assetBags,
        colors: [kL1, kL12]),
    const Level(
        icon: Icons.play_arrow,
        title: 'Multiple Choice',
        subtitle: 'Level 2',
        image: assetBallonSmall,
        colors: [kL2, kL22]),
  ];

  void navigation(index) {
    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => LevelDescription(
                    level: levels[0],
                    onTap: () {
                      Navigator.pushNamed(context, TrueFalseQuiz.routeName);
                    })));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => LevelDescription(
                    level: levels[1],
                    onTap: () {
                      Navigator.pushNamed(context, MultiQScreen.routeName);
                    })));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          MYOutlineBtn(
            padding: const EdgeInsets.symmetric(vertical: 4),
            icon: Icons.favorite,
            iconColor: kBlueIcon,
            bColor: kGreyFont.withOpacity(0.5),
            function: () {
              print("11111");
            },
          ),
          MYOutlineBtn(
              padding: const EdgeInsets.symmetric(vertical: 4),
              icon: Icons.person,
              iconColor: kBlueIcon,
              bColor: kGreyFont.withOpacity(0.5),
              function: () {
                print("2222");
              }),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Let\'s Play',
              style: TextStyle(
                fontSize: 32,
                color: kRedFont,
                fontWeight: FontWeight.bold,
                fontFamily: kFontFamily,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Be the First!',
              style: TextStyle(
                fontSize: 18,
                color: kGreyFont,
                fontFamily: kFontFamily,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return MyLevelWidget(
                      fun: () {
                        navigation(index);
                      },
                      level: levels[index]);
                },
                itemCount: levels.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
