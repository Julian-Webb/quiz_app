// return some text widget

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/quiz_question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  // what does this do?
  // it is called when the object is initialized and creates the first state
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late List<int> questionOrder;
  late int nQuestions;
  int questionCount = 0;

  @override
  void initState() {
    super.initState();

    // generate an order for the questions and shuffle it randomly
    nQuestions = questions.length;
    questionOrder =
        List<int>.generate(nQuestions, (int index) => index, growable: true);
    questionOrder.shuffle();
  }

  void nextQuestion() {
    questionCount++;
    if (questionCount < nQuestions) {
      setState(() {});
    } else {
      // we want to go to the end screen
    }
  }

  @override
  build(context) {
    // select the next question and delete it from the list
    QuizQuestion quizQuestion = questions[questionOrder[0]];
    questionOrder.removeAt(0);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            quizQuestion.text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
          const SizedBox(height: 30),
          FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: const Color.fromARGB(158, 102, 102, 102),
                foregroundColor: Colors.white),
            onPressed: nextQuestion,
            child: Text(quizQuestion.answers[0]),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: const Color.fromARGB(158, 102, 102, 102),
                foregroundColor: Colors.white),
            onPressed: nextQuestion,
            child: Text(quizQuestion.answers[1]),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: const Color.fromARGB(158, 102, 102, 102),
                foregroundColor: Colors.white),
            onPressed: nextQuestion,
            child: Text(quizQuestion.answers[2]),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: const Color.fromARGB(158, 102, 102, 102),
                foregroundColor: Colors.white),
            onPressed: nextQuestion,
            child: Text(quizQuestion.answers[3]),
          ),
        ],
      ),
    );
  }
}
