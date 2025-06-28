import 'package:team_quiz_app/view/pages/questions/brain/quiz_brain.dart';

import '../../../../modules/question.dart';

class TrueFalseBrain extends QuizBrain {
  @override
  // TODO: implement questionBank
  List<Question> get questionBank => [
        Question("Are You Happy", 0, ['True', "False"]),
        Question("Are You Happy", 1, ['True', "False"]),
        Question("Are You Happy", 0, ['True', "False"]),
        Question("Are You Happy", 1, ['True', "False"]),
      ];
}
