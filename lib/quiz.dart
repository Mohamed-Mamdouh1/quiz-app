import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'start_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
 List<String> selectedAnswer = [];
  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if(selectedAnswer.length==questions.length){


    setState((){
      activeScreen="result-screen";

    });


    }
  }
  void restartQuiz(){
    setState(() {
      selectedAnswer=[];
      activeScreen="question-screen";
    });
  }

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {

      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget =
         StartScreen(
            color1: Colors.deepPurple.shade500,
            color2: Colors.deepPurple,
            color3: Colors.deepPurple.shade800,
            color4: Colors.deepPurple.shade900,
            startQuiz: switchScreen,
          )
        ;
    if(activeScreen=="questions-screen"){
      screenWidget =QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );

    }else if(activeScreen=="result-screen"){
      screenWidget = ResultScreen(chosenAnswer: selectedAnswer,onRefreshed:restartQuiz ,);
    }


    return MaterialApp(
theme: Theme.of(context).copyWith(
  colorScheme: Theme.of(context).colorScheme.copyWith(secondary: Colors.deepPurple)
),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: screenWidget),
    );
  }
}
