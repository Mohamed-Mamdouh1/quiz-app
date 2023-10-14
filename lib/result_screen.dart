import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/model/quiz_questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/start_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {Key? key, required this.chosenAnswer, required this.onRefreshed})
      : super(key: key);
  final List<String> chosenAnswer;
  final void Function() onRefreshed;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int numTotalQuestions = questions.length;

    final summaryData = getSummaryData();
    var numCorrectQuestions = summaryData.where((data) {
      return data["user_answer"] == data["correct_answer"];
    }).length;

    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.deepPurple.shade500,
              Colors.deepPurple,
              Colors.deepPurple.shade800,
              Colors.deepPurple.shade900,
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            numCorrectQuestions >= numTotalQuestions / 2.toInt()
                ? Image.asset("assets/images/success.png",width: 200,height: 200,)
                : Image.asset("assets/images/failed.png",width: 200,height: 200,),
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly! ",
              style:
                  TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                icon: const Icon(Icons.refresh),
                onPressed: onRefreshed,
                label: const Text("Refresh Quiz!")),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                icon: const Icon(Icons.exit_to_app),
                onPressed: () {
                  SystemNavigator.pop();
                },
                label: const Text("Exit App")),
          ],
        ));
  }
}
