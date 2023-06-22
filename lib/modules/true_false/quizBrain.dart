import 'package:team_quiz_app/modules/true_false/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> questionBank = [
    Question(
      'You can lead a cow down stairs but not up stairs.',
      false,
    ),
    Question(
      'Approximately one quarter of human bones are in the feet.',
      true,
    ),
    Question(
      'A slug\'s blood is green.',
      true,
    ),
  ];

  String getQuestionText() {
    return questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return questionBank[_questionNumber].questionAnswer;
  }

  void nextQuestion() {
    if (_questionNumber < questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber >= questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }

  int get questionsLength => questionBank.length;
}
