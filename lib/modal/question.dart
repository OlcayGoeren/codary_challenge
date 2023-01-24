class Question {
  String questionTitle;
  List<String> answers;
  List<int> rightAnswer;

  Question(
      {required this.answers,
      required this.questionTitle,
      required this.rightAnswer});
}
