// return some text widget

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/quiz_question.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

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
  late int nQuestions; // the number of questions
  int questionCount = 0; // how many questions were currently asked
  int nAnswers = 4; // the number of answers per question

  // which answers were given to each question
  final List<String> answersGiven = [];
  // the correct answers for each question
  final List<String> correctAnswers = [];

  @override
  void initState() {
    super.initState();

    // generate an order for the questions and shuffle it randomly
    nQuestions = questions.length;
    questionOrder =
        List<int>.generate(nQuestions, (int index) => index, growable: true);
    questionOrder.shuffle();
  }

  void nextQuestion(String answerGiven) {
    questionCount++;
    answersGiven.add(answerGiven);
    if (questionCount < nQuestions) {
      setState(() {});
    } else {
      // we want to go to the summary screen
      widget.endQuiz(questionOrder, answersGiven, correctAnswers);
    }
  }

  @override
  build(context) {
    // select the next question
    QuizQuestion quizQuestion = questions[questionOrder[questionCount]];
    // add correct answers to list (it's always at index 0)
    correctAnswers.add(quizQuestion.answers[0]);

    return Center(
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // makes elements stretch to full width
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quizQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 243, 218, 250),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            // map allows us to go through entire list and execute a function for it
            // three dots (...) spreads (unpacks) values into a list!!!
            ...quizQuestion.getShuffledAnswers().map(
              (answer) {
                return AnswerButton(answer, nextQuestion);
              },
            ),
          ],
        ),
      ),
    );
  }
}
