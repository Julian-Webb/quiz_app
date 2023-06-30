import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

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
  Widget build(context) {
    // count how many answers were correct and how many total questions there
    // were
    int nQuestions = questions.length;
    int nCorrect = 0;

    List<Widget> results = List<Widget>.empty(growable: true);
    for (int i = 0; i < nQuestions; i++) {
      if (answersGiven[i] == correctAnswers[i]) nCorrect += 1;

      // add blue circle with question number
      results.add(
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          child: Text(
            (i + 1).toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );

      // add question, given answer, and correct answer
      results.add(
        Column(
          children: [
            Text(questions[questionOrder[i]].text,
                style: const TextStyle(color: Colors.grey)), // question text
            Text(answersGiven[i]), // given answer
            Text(correctAnswers[i]) // correct answer
          ],
        ),
      );
    }

    // results = List<Widget>.generate(
    //   6,
    //   (_) => Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Container(
    //       height: 30,
    //       width: 30,
    //       color: Colors.blue,
    //     ),
    //   ),
    // );

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // insert Text about how many questions were answered correctly at beginning
          Text(
            "You answered $nCorrect out of $nQuestions questions correctly!",
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            children: results,
          ),
          // insert Button to replay at the end
          OutlinedButton.icon(
            onPressed: restartQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: const Text('Restart Quiz'),
            icon: const Icon(Icons.replay),
          ),
        ],
      ),
    );
  }
}
