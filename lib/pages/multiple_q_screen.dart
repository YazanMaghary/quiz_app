import 'dart:async';

import 'package:flutter/material.dart';

import 'package:team_quiz_app/widgets/alert.dart';
import 'package:team_quiz_app/widgets/quiz_header.dart';
import 'package:team_quiz_app/widgets/score_keeper_view.dart';
import '../constants.dart';
import '../modules/multipe_choice/quiz_brain_multiple.dart';
import '../widgets/choice_button.dart';

class MultiQScreen extends StatefulWidget {
  static const routeName = 'level2';

  const MultiQScreen({Key? key}) : super(key: key);

  @override
  State<MultiQScreen> createState() => _MultiQScreenState();
}

class _MultiQScreenState extends State<MultiQScreen> {
  QuizBrainMulti quizMulti = QuizBrainMulti();

  int? userChoice;
  int counter = 10;
  bool? isCorrect;
  late Timer timer;
  List<bool> scoreKeeper = [];
  bool _isUserTapChoice = false;
  int correctResult = 0;

  void setIsUserTapChoice(bool value) {
    _isUserTapChoice = value;
  }

  void reset() {
    scoreKeeper.clear();
    quizMulti.reset();
    reSetNextQuestionVariables();
    startTimer();
    correctResult = 0;
  }

  void reSetNextQuestionVariables() {
    setIsUserTapChoice(false);
    counter = 10;
    userChoice = null;
    isCorrect = null;
  }

  void checkAnswer() {
    int correctAnswer = quizMulti.getQuestionAnswer();
    if (userChoice == null || correctAnswer != userChoice) {
      scoreKeeper.add(false);
      isCorrect = false;
    } else {
      correctResult++;
      scoreKeeper.add(true);
      isCorrect = true;
    }
    if (counter <= 0) {
      reSetNextQuestionVariables();
      quizMulti.nextQuestion();
    }
  }

  void showResult(BuildContext context) {
    timer.cancel();
    showAlert(
        context: context,
        correctResult: correctResult,
        total: scoreKeeper.length,
        onTapRestart: () {
          reset();
          Navigator.pop(context);
        });
  }

  Color disabledBackgroundColor(int index) {
    if (isCorrect == null) {
      return Colors.white;
    } else {
      if (isCorrect! && userChoice == index) {
        return kG1;
      } else if (userChoice == index) {
        return Colors.red;
      } else {
        return Colors.grey;
      }
    }
  }

  void goToNext(BuildContext context) {
    if (quizMulti.isFinished()) {
      showResult(context);
    } else {
      // if _isUserTapChoice false then its mean that checkAnswer() is not performed because the user does not tap on choice

      if (_isUserTapChoice == false) {
        checkAnswer();
      }
      reSetNextQuestionVariables();
      quizMulti.nextQuestion();
      // isCorrect = null;
    }
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        counter--;
        if (counter == 0) {
          userChoice = null;
          goToNext(context);
        }
      });
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kBlueBg,
              kL2,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QuizHeader(counter: counter),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Image.asset(assetBallonBig),
                  ),
                ),
              ),
              Text(
                'question ${quizMulti.questionNumber+1} of ${quizMulti.getQuestionBankLength()}',
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
                quizMulti.getQuestionText(),
                style: const TextStyle(
                  fontSize: 32,
                  fontFamily: kFontFamily,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: quizMulti.getOptions().length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ChoiceButton(
                        onTap: !_isUserTapChoice
                            ? () {
                                setState(() {
                                  selectChoice(index);
                                });
                              }
                            : null,
                        isUserTap: _isUserTapChoice,
                        isCorrect: (isCorrect ?? false) && userChoice == index,
                        disabledBackgroundColor: disabledBackgroundColor(index),
                        body: quizMulti.getOptions()[index],
                      ),
                    );
                  },
                ),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      goToNext(context);
                      isCorrect = null;
                      counter = 10;
                      // isButtonDisabled = false;
                    });
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  )),
              ScoreKeeperView(scoreKeeper: scoreKeeper),
            ],
          ),
        ),
      ),
    );
  }

  void selectChoice(int index) {
    userChoice = index;
    checkAnswer();
    _isUserTapChoice = true;
  }
}
