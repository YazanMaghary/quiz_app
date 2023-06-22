import 'dart:async';

import 'package:flutter/material.dart';

import '../constants.dart';
import '../modules/multipe_choice/quizBrainMultiple.dart';
import '../widgets/my_outline_btn.dart';
import 'home.dart';

class MultiQScreen extends StatefulWidget {
  const MultiQScreen({Key? key}) : super(key: key);

  @override
  State<MultiQScreen> createState() => _MultiQScreenState();
}

class _MultiQScreenState extends State<MultiQScreen> {
  var questionNumber = 5;
  var questionsCount = 10;
  int userChiose = 0;
  QuizBrainMulti quiz_multi = QuizBrainMulti();
  Icon? icon;
  int maxWaiting = 10;
  int currentTimer = 1;
  bool? isCorrect;
  late Timer timer;
  List<bool> scoreKeeper = [];
  void checkAnswer(int? userChoice) {
    int correctAnswer = quiz_multi.getQuestionAnswer();
    print('correctAnswer $correctAnswer');
    print("userChoice $userChoice");
    if (correctAnswer == userChoice) {
      scoreKeeper.add(true);
      isCorrect = true;
    } else {
      scoreKeeper.add(false);
      isCorrect = false;
    }

    if (quiz_multi.isFinished()) {
      timer.cancel();
      print('finished');
      int correct = scoreKeeper.where((element) => element == true).length;
      Timer(Duration(seconds: 1), () {
        setState(() {
          quiz_multi.reset();
          scoreKeeper.clear();
        });
        Navigator.pop(context);
        Navigator.pop(context);
      });
    } else {
      quiz_multi.nextQuestion();
      isCorrect = null;
    }
  }

  void timer_set() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentTimer++;
        if (currentTimer >= 10) {
          checkAnswer(null);
          currentTimer = 0;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
          padding: const EdgeInsets.only(top: 74, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 44,
                    width: 44,
                    child: MYOutlineBtn(
                      icon: Icons.close,
                      iconColor: Colors.white,
                      bColor: Colors.white,
                      function: () {
                        // Navigator.pop(context);
                        // Navigator.pop(context);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                  ),
                  // OutlinedButton(
                  //   onPressed: () {},
                  //   style: ButtonStyle().copyWith(
                  //     shape: MaterialStatePropertyAll(
                  //       RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(25),
                  //       ),
                  //     ),
                  //     side: MaterialStatePropertyAll(
                  //       BorderSide(color: Colors.white),
                  //     ),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Icon(
                  //         Icons.favorite,
                  //         color: Colors.white,
                  //       ),
                  //       SizedBox(
                  //         width: 8,
                  //       ),
                  //       const Text(
                  //         '3',
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 56,
                        width: 56,
                        child: CircularProgressIndicator(
                          value: 0.7,
                          color: Colors.white,
                          backgroundColor: Colors.white12,
                        ),
                      ),
                      Text(
                        '05',
                        style: TextStyle(
                          fontFamily: 'Sf-Pro-Text',
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),

                  OutlinedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        side: BorderSide(color: Colors.white)),
                  )
                ],
              ),
              Expanded(
                child: Center(
                  child: Image.asset('assets/images/ballon-b.png'),
                ),
              ),
              Text(
                'question $questionNumber of $questionsCount',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Sf-Pro-Text',
                  color: Colors.white60,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                quiz_multi.getQuestionText(),
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Sf-Pro-Text',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 48,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: quiz_multi.getOptions().length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            checkAnswer(index);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          disabledBackgroundColor: isCorrect == null
                              ? Colors.white
                              : isCorrect! && userChiose == index
                                  ? Colors.lightGreen
                                  : userChiose == index
                                      ? Colors.red
                                      : Colors.white,
                          backgroundColor: isCorrect == null
                              ? Colors.white
                              : isCorrect! && userChiose == index
                                  ? Colors.lightGreen
                                  : userChiose == index
                                      ? Colors.red
                                      : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 24,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  quiz_multi.getOptions()[index],
                                  style: TextStyle(
                                      color: kL2,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.check_rounded,
                              color: kL2,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 48,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
