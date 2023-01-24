import 'package:codary/views/question_view.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  int count;

  ResultView(this.count);
  @override
  Widget build(BuildContext context) {
    final countString = count.toString();
    return WillPopScope(
        child: SafeArea(
            top: false,
            child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  title: Text("Ergebnis"),
                ),
                body: Container(
                    margin: EdgeInsets.all(10),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Du hast $countString/3",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        TextButton(
                            onPressed: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuestionView(0, 0)),
                              );
                            }),
                            child: Text("Wiederholen"))
                      ],
                    ))))),
        onWillPop: () async => false);
    ;
  }
}
