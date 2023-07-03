import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class SummaryScreen extends StatelessWidget {
  // this should show every question, the correct answer, the answer given,
  // indicate with a color whether it was correct and show how many answers
  // were correct

  final List<int> questionOrder;
  final List<String> answersGiven;
  final List<String> correctAnswers;
  final Function() restartQuiz;

  const SummaryScreen(this.questionOrder, this.answersGiven,
      this.correctAnswers, this.restartQuiz,
      {super.key});

  @override
  Widget build(BuildContext context) {
    // count how many answers were correct and how many total questions there
    // were
    int nQuestions = questions.length;
    int nCorrect = 0;
    for (int i = 0; i < nQuestions; i++) {
      if (answersGiven[i] == correctAnswers[i]) nCorrect += 1;
    }

    return SizedBox(
      // makes it take up the whole screen
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // insert Text about how many questions were answered correctly at beginning
            Text(
              "You answered $nCorrect out of $nQuestions questions correctly!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(200, 255, 255, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(questionOrder, answersGiven, correctAnswers),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: restartQuiz,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              label: const Text('Restart Quiz'),
              icon: const Icon(Icons.replay),
            ),
          ],
        ),
      ),
    );
  }
}
