import 'package:team_quiz_app/modules/question_multiple.dart';

import '../multipe_choice/quiz_brain_multiple.dart';

class SubBrain extends QuizBrainMulti{

  @override
  // TODO: implement questionBank
  List<QuestionMultiple> get questionBank => [
    QuestionMultiple("Are You Happy",0 ,['True',"False"] ),
    QuestionMultiple("Are You Happy",1 ,['True',"False"] ),
    QuestionMultiple("Are You Happy",0 ,['True',"False"] ),
    QuestionMultiple("Are You Happy",1 ,['True',"False"] ),
  ];

}