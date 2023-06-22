import 'dart:async';

import 'package:flutter/material.dart';
import 'package:team_quiz_app/pages/result.dart';
import 'package:team_quiz_app/pages/home.dart';
import 'package:team_quiz_app/pages/home.dart';
import 'package:team_quiz_app/widgets/my_outline_btn.dart';
import '../constants.dart';
import '../modules/multipe_choice/quizBrainMultiple.dart';

class MultiQScreen extends StatefulWidget {
  static const routeName = 'level2';

  const MultiQScreen({Key? key}) : super(key: key);

  @override
  State<MultiQScreen> createState() => _MultiQScreenState();
}

class _MultiQScreenState extends State<MultiQScreen> {
  var questionNumber = 5;
  var questionsCount = 10;
  int? userChiose;
  int counter = 10;
  int? choise;
  QuizBrainMulti quiz_multi = QuizBrainMulti();
  Icon? icon;
  int maxWaiting = 10;
  int currentTimer = 1;
  bool? isCorrect;
  late Timer timer;
  List<bool> scoreKeeper = [];
  bool isButtonDisabled = false;
  int res = 0;
  void checkAnswer(int? userChoice) {
    if (userChiose == null) {
      counter = 10;
      quiz_multi.nextQuestion();
    } else {
      int correctAnswer = quiz_multi.getQuestionAnswer();
      if (correctAnswer == userChoice) {
        res++;
        scoreKeeper.add(true);
        isCorrect = true;
        timer_set();
        isButtonDisabled = false;
      } else {
        scoreKeeper.add(false);
        isCorrect = false;
        timer_set();
        isButtonDisabled = false;
      }
    }
  }

  void timer_set() {
    if (counter <= 0) {
      quiz_multi.nextQuestion();
      counter = 10;
      userChiose = null;
    }
  }

  void checkQuestion() {
    if (quiz_multi.isFinished()) {
      print('finished');

      setState(() {
        quiz_multi.reset();
        scoreKeeper.clear();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    resultPage(res, quiz_multi.getquestionBankLength())));
      });
    } else {
      quiz_multi.nextQuestion();
      // isCorrect = null;
    }
  }

  // void timer_set() {
  //   timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //     setState(() {
  //       currentTimer++;
  //       if (currentTimer >= 10) {
  //         checkAnswer(-1);
  //         currentTimer = 0;
  //       }
  //     });
  //   });
  // }

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        counter--;
      });
      if (counter == 0) {
        checkAnswer(null);
      }
    });
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
          padding: const EdgeInsets.only(top: 60, left: 24, right: 24),
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
                          value: counter / 10,
                          color: Colors.white,
                          backgroundColor: Colors.white12,
                        ),
                      ),
                      Text(
                        "$counter",
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Image.asset('assets/images/ballon-b.png'),
                  ),
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
                          isButtonDisabled == false
                              ? setState(() {
                                  userChiose = index;
                                  checkAnswer(index);
                                  isButtonDisabled = true;
                                })
                              : () {
                                  // Button action
                                };
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
              ElevatedButton(
                  onPressed: () {
                    // checkAnswer(choise);
                    setState(() {
                      checkQuestion();
                      isCorrect = null;
                      counter = 10;
                      isButtonDisabled = false;
                    });
                  },
                  child: Text("Next"))
            ],
          ),
        ),
      ),
    );
  }
}
