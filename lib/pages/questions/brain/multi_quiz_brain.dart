import 'package:team_quiz_app/pages/questions/brain/quiz_brain.dart';

import '../../../modules/question.dart';

class MultiBrain extends QuizBrain {
  @override
  // TODO: implement questionBank
  List<Question> get questionBank => [
        Question('You can lead a cow down stairs but not up stairs.', 1,
            ['always', 'never', 'sometimes']),
        Question('Approximately one quarter of human bones are in the feet.', 0,
            ['agree', 'disagree', 'not sure']),
      ];
}
