import 'package:team_quiz_app/modules/question_multiple.dart';

class QuizBrainMulti {
  int _questionNumber = 0;

  int get questionNumber => _questionNumber;
  final List<QuestionMultiple> questionBank = [
    QuestionMultiple('You can lead a cow down stairs but not up stairs.', 1,
        ['always', 'never', 'sometimes']),
    QuestionMultiple(
        'Approximately one quarter of human bones are in the feet.',
        0,
        ['agree', 'disagree', 'not sure']),
  ];

  String getQuestionText() {
    return questionBank[_questionNumber].questionText;
  }

  int getQuestionBankLength() {
    return questionBank.length;
  }

  int getQuestionAnswer() {
    return questionBank[_questionNumber].questionAnswer;
  }

  List<String> getOptions() {
    return questionBank[_questionNumber].options;
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
}
