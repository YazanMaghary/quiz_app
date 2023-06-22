import 'package:flutter/material.dart';
import 'package:team_quiz_app/pages/home.dart';

class resultPage extends StatelessWidget {
  late int res;
  late int numOfQ;
  resultPage(this.res, this.numOfQ, {super.key});

  @override
  Widget build(BuildContext context) {
    int numOfLoses = numOfQ - res;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(numOfLoses > res ? 'Sadly..' : 'Congrats',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text('You\'ve got $res correct answers out of $numOfQ',
                style: TextStyle(fontSize: 18)),
            Spacer(),
            SizedBox(
              width: 256,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.pushAndRemoveUntil(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => LevelDescription()),
                  //   (route) {
                  //     return false;
                  //   },
                  // );
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text('Try Again?'),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 256,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text('Go to main menu'),
              ),
            ),
            SizedBox(height: 64)
          ],
        ),
      ),
    );
  }
}
