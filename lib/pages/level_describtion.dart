import 'package:flutter/material.dart';
import 'package:team_quiz_app/modules/level.dart';

import '../constants.dart';

class LevelDescription extends StatelessWidget {
  const LevelDescription({Key? key, required this.level, required this.onTap})
      : super(key: key);
  final Level level;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: level.colors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 74, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: const ButtonStyle().copyWith(
                      shape: const MaterialStatePropertyAll(
                        CircleBorder(),
                      ),
                      side: const MaterialStatePropertyAll(
                        BorderSide(color: Colors.white),
                      ),
                      padding:
                          const MaterialStatePropertyAll(EdgeInsets.all(8))),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Image.asset(assetBallonBig),
                ),
              ),
              Text(
                level.subtitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: kFontFamily,
                  color: Colors.white60,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                level.title,
                style: const TextStyle(
                  fontSize: 32,
                  fontFamily: kFontFamily,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                'Do you feel confident? Here you\'ll challenge one of our most difficult travel questions!',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: kFontFamily,
                  color: Colors.white60,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(16),
                    elevation: 15,
                  ),
                  child: const Center(
                    child: Text(
                      'Game',
                      style: TextStyle(
                          color: kL2,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
