import '../../../../modules/question.dart';

abstract class QuizBrain {
  int _questionNumber = 0;

  int get questionNumber => _questionNumber;
  late List<Question> questionBank;

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
