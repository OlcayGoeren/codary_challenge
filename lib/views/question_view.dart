import 'package:codary/components/question_tile_component.dart';
import 'package:codary/modal/question_store.dart';
import 'package:codary/views/result_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionView extends StatelessWidget {
  final int currentCount;
  final int rightAnswersCount;
  List<bool> correctAnswers = [false, false, false, false];

  QuestionView(this.currentCount, this.rightAnswersCount, {super.key});

  changeAnswer(int i, bool active) {
    correctAnswers[i] = active;
  }

  @override
  Widget build(BuildContext context) {
    final question = QuestionStore.questions[currentCount];

    return WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
            top: false,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                title: Text("${currentCount + 1}/3"),
              ),
              body: Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          question.questionTitle,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      QuestionTile(question.answers[0], changeAnswer, 0),
                      QuestionTile(question.answers[1], changeAnswer, 1),
                      QuestionTile(question.answers[2], changeAnswer, 2),
                      QuestionTile(question.answers[3], changeAnswer, 3),
                      const SizedBox(),
                      const Spacer(),
                      TextButton(
                          onPressed: (() {
                            var result = QuestionStore.validateAnswer(
                                correctAnswers, question);
                            if (currentCount == 2) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResultView(result
                                        ? rightAnswersCount + 1
                                        : rightAnswersCount)),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuestionView(
                                        currentCount + 1,
                                        result
                                            ? rightAnswersCount + 1
                                            : rightAnswersCount)),
                              );
                            }
                          }),
                          child:
                              Text(currentCount == 2 ? "Ergebnis" : "Weiter"))
                    ],
                  )),
            )));
  }
}
