import 'package:flutter/material.dart';
import '../constants.dart';
import 'my_outline_btn.dart';

import 'package:team_quiz_app/modules/level.dart';

class MyLevelWidget extends StatelessWidget {
  final Function() fun;
  final Level level;
  const MyLevelWidget({super.key, required this.fun, required this.level});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 54, bottom: 24),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: level.colors,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 44,
                  width: 44,
                  child: MYOutlineBtn(
                    icon: level.icon,
                    iconColor: Colors.white,
                    bColor: Colors.white,
                    function: () {},
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  level.subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white60,
                    fontFamily: kFontFamily,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  level.title,
                  style: const TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: kFontFamily,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 28.0),
            child: Image.asset(level.image),
          ),
        ],
      ),
    );
  }
}
