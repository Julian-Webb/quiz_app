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
  late List<List<int>> answerOrders;
  late int nQuestions;
  int questionCount = 0;
  int nAnswers = 4;

  @override
  void initState() {
    super.initState();

    // generate an order for the questions and shuffle it randomly
    nQuestions = questions.length;
    questionOrder =
        List<int>.generate(nQuestions, (int index) => index, growable: true);
    questionOrder.shuffle();

    // generate an order for the answers to the questions and shuffle randomly
    // we want a list the length of the number of questions that contains
    // lists from 1 to 4 in random order representing the order of the answers
    answerOrders =
        List.generate(nQuestions, (_) => List<int>.filled(nAnswers, 0));
    for (int i = 0; i < nQuestions; i++) {
      List<int> answerOrder = List.generate(nAnswers, (index) => index);
      answerOrder.shuffle();
      answerOrders[i] = answerOrder;
    }
  }

  void nextQuestion() {
    questionCount++;
    if (questionCount < nQuestions) {
      setState(() {});
    } else {
      // we want to go to the summary screen
      print("No more questions");
    }
  }

  @override
  build(context) {
    // select the next question
    QuizQuestion quizQuestion = questions[questionOrder[questionCount]];
    // get the answerOrder for this question
    List<int> answerOrder = answerOrders[questionCount];

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
            child: Text(quizQuestion.answers[answerOrder[0]]),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: const Color.fromARGB(158, 102, 102, 102),
                foregroundColor: Colors.white),
            onPressed: nextQuestion,
            child: Text(quizQuestion.answers[answerOrder[1]]),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: const Color.fromARGB(158, 102, 102, 102),
                foregroundColor: Colors.white),
            onPressed: nextQuestion,
            child: Text(quizQuestion.answers[answerOrder[2]]),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: const Color.fromARGB(158, 102, 102, 102),
                foregroundColor: Colors.white),
            onPressed: nextQuestion,
            child: Text(quizQuestion.answers[answerOrder[3]]),
          ),
        ],
      ),
    );
  }
}
