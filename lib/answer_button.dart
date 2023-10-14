import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final void Function() onTap;
  final String text;

  const AnswerButton(this.text, this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,

      style: ElevatedButton.styleFrom(
        primary: Colors.purple[900],
        padding: EdgeInsets.symmetric(horizontal: 40,vertical: 12),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(text,textAlign: TextAlign.center,),
    );
  }
}
