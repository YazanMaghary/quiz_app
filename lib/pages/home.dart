// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:team_quiz_app/pages/multipe_choice/quiz_brain_multiple.dart';
import 'package:team_quiz_app/pages/true_false/sub_model.dart';
import 'package:team_quiz_app/shared/resources/colors.dart';
import 'package:team_quiz_app/modules/level.dart';

import '../routing/routes.dart';
import '../shared/resources/assets.dart';
import '../shared/widgets/app_bar.dart';
import '../shared/widgets/my_level_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Level> levels = [
     Level(
      icon: Icons.check,
      title: 'True or False',
      subtitle: 'Level 1',
      image: assetBags,
      colors: [kL1, kL12],
      route: Routes.multiple,
      quizBrain: SubBrain() ,
    ),
     Level(
      icon: Icons.play_arrow,
      title: 'Multiple Choice',
      subtitle: 'Level 2',
      image: assetBallonSmall,
      colors: [kL2, kL22],
      route: Routes.multiple,
      quizBrain: QuizBrainMulti(),

    ),
  ];
  List<MyLevelWidget> levelWidgets = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  void addToWidgets() {
    for (int i = 0; i < levels.length; i++) {
      levelWidgets.add(MyLevelWidget(
          fun: () {
            Navigator.pushNamed(context, Routes.levelDescription,
                arguments: levels[i]);
          },
          level: levels[i]));
      _key.currentState?.insertItem(
        i,
      );
    }
  }

  Tween<Offset> myOffset =
      Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0));
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      addToWidgets();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 28,
            ),
          ),
          HomeAppBar(
            onTapLove: () {},
            onTapPerson: () {},
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: AnimatedList(
              key: _key,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: NeverScrollableScrollPhysics(),
              initialItemCount: levelWidgets.length,
              itemBuilder: (context, index, animation) => SlideTransition(
                position: animation.drive(myOffset),
                child: levelWidgets[index],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 28,
            ),
          ),
        ],
      ),
    );
  }
}
