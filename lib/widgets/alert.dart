import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Future showAlert(
    {required BuildContext context,
    required int correctResult,
    required int total,
    required VoidCallback onTapRestart}) async {
  await Alert(
      context: context,
      title: "Finished",
      desc: resultMessage(correctResult, total),
      style: AlertStyle(animationType: AnimationType.fromLeft),
      closeFunction: () {
        popToLevelDescription(context);
      },
      buttons: [
        DialogButton(
            child: const Text(
              "Exit",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              popToLevelDescription(context);
            }),
        DialogButton(
            child: const Text(
              "Restart",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: onTapRestart),
      ]).show();
}

void popToLevelDescription(BuildContext context) {
  Navigator.pop(context);
  Navigator.pop(context);
}

String resultMessage(int mark, int totalMark) {
  double result = (mark / totalMark) * 100;
  print("result $result mark $mark total $totalMark ");
  String msg = "Yore Result is ${result.round()}%\n";
  switch (result) {
    case < 60:
      return "$msg Please Check If You Have A Brain";
    case < 80:
      return "$msg Not Bad";
    case < 90:
      return "$msg You Almost There";
    case < 100:
      return "$msg You Are Hard Worker";
    case == 100.0:
      return "$msg You Are The Jewish Student";
  }
  return "Some thing wont wrong\nPlease try again";
}
