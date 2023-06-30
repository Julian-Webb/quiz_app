// return some text widget

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/quiz_question.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(List<int>, List<String>, List<String>) endQuiz;

  const QuestionsScreen(this.endQuiz, {super.key});

  // what does this do?
  // it is called when the object is initialized and creates the first state
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late List<int> questionOrder; // the order of the questions
  late List<List<int>>
      answerOrders; // the order of the answers for each question
  late int nQuestions; // the number of questions
  int questionCount = 0; // how many questions were currently asked
  int nAnswers = 4; // the number of answers per question

  // which answers were given to each question
  List<String> answersGiven = List<String>.empty(growable: true);
  // the correct answers for each question
  List<String> correctAnswers = List<String>.empty(growable: true);

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

  void nextQuestion(answerGiven) {
    questionCount++;
    answersGiven.add(answerGiven);
    if (questionCount < nQuestions) {
      setState(() {});
    } else {
      // ignore: avoid_print
      print("==========================");
      // ignore: avoid_print
      print(" quiz will end ");
      // ignore: avoid_print
      print("==========================");
      // we want to go to the summary screen
      widget.endQuiz(questionOrder, answersGiven, correctAnswers);
    }
  }

  @override
  build(context) {
    // select the next question
    QuizQuestion quizQuestion = questions[questionOrder[questionCount]];
    // get the answerOrder for this question
    List<int> answerOrder = answerOrders[questionCount];
    // add correct answers to list (it's always at index 0)
    correctAnswers.add(quizQuestion.answers[0]);

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
            onPressed: () {
              nextQuestion(quizQuestion.answers[answerOrder[0]]);
            },
            child: Text(quizQuestion.answers[answerOrder[0]]),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: const Color.fromARGB(158, 102, 102, 102),
                foregroundColor: Colors.white),
            onPressed: () {
              nextQuestion(quizQuestion.answers[answerOrder[1]]);
            },
            child: Text(quizQuestion.answers[answerOrder[1]]),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: const Color.fromARGB(158, 102, 102, 102),
                foregroundColor: Colors.white),
            onPressed: () {
              nextQuestion(quizQuestion.answers[answerOrder[2]]);
            },
            child: Text(quizQuestion.answers[answerOrder[2]]),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
                backgroundColor: const Color.fromARGB(158, 102, 102, 102),
                foregroundColor: Colors.white),
            onPressed: () {
              nextQuestion(quizQuestion.answers[answerOrder[3]]);
            },
            child: Text(quizQuestion.answers[answerOrder[3]]),
          ),
        ],
      ),
    );
  }
}
