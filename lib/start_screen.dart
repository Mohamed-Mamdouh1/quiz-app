import 'package:quiz_app/styled_text.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  final void Function() ?startQuiz;
  const StartScreen(
      {Key? key,
      required this.color1,
      required this.color2,
      required this.color3,
      required this.color4,this.startQuiz})
      : super(key: key);

  @override
  Widget build(context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color1, color2, color3, color4]),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/quiz-logo.png",
                height: 300,
                width: 300,
                color: Colors.white54,
              ),
              const SizedBox(
                height: 80,
              ),
              const StyledText(text: "Learn Flutter the fun way!"),
              const SizedBox(
                height: 80,
              ),

                  TextButton(
                    onPressed: () {
                      startQuiz!();
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.deepPurple,
                      backgroundColor: Colors.deepPurple[800],
                      shadowColor: Colors.deepPurple[900],
                      elevation: 2,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const[
                            Icon(Icons.arrow_right_alt,color: Colors.white,),
                         Text(
                          "Start Quiz",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),


            ],
          ),
        ));
  }
}
