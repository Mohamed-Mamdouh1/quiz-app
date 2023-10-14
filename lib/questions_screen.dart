import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
   QuestionsScreen({super.key,required this.onSelectAnswer});
  void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
  widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }
  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.deepPurple.shade500,
        Colors.deepPurple,
        Colors.deepPurple.shade800,
        Colors.deepPurple.shade900,
      ])),
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Color.fromARGB(255, 237, 223,252),
                fontSize: 24,
              )
            ),
            SizedBox(
              height: 30,
            ),
            ...currentQuestion
                .getShuffledAnswers()
                .map((answer) => AnswerButton(answer, (){
                  answerQuestion(answer);
            }))
          ],
        ),
      ),
    );
  }
}
