import 'package:flutter/material.dart';

class resultPage extends StatelessWidget {
  late int res;
  late int numOfQ;
  resultPage(this.res, this.numOfQ, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('You\'ve got $res correct answers out of $numOfQ'),
          ),
        ],
      ),
    );
  }
}
