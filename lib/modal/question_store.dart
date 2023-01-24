import 'package:codary/contstants.dart';
import 'package:codary/modal/question.dart';

class QuestionStore {
  static final List<Question> questions = [
    FIRST_QUESTION,
    SECOND_QUESTION,
    THIRD_QUESTION
  ];

  static bool validateAnswer(
      List<bool> userAnswers, Question selectedQuestion) {
    var correct = true;
    for (var i = 0; i < userAnswers.length; i++) {
      if ((-1 ==
          selectedQuestion.rightAnswer
              .firstWhere((element) => element == i, orElse: (() => -1)))) {
        if (!userAnswers[i]) {
          continue;
        } else {
          return false;
        }
      } else {
        if (userAnswers[i]) {
          continue;
        } else {
          return false;
        }
      }
    }
    return true;
  }
}
