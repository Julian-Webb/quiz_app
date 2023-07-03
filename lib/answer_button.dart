import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String str; // the string (answer) that the button contains
  final Function nextQuestion;

  const AnswerButton(this.str, this.nextQuestion, {super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          backgroundColor: const Color.fromARGB(158, 102, 102, 102),
          foregroundColor: Colors.white,
          shape: const StadiumBorder(
              side: BorderSide(width: 1, color: Colors.black))),
      onPressed: () {
        nextQuestion(str);
      },
      child: Text(str, textAlign: TextAlign.center),
    );
  }
}
