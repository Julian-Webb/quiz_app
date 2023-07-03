import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(
      this.questionOrder, this.answersGiven, this.correctAnswers,
      {super.key});

  final List<int> questionOrder;
  final List<String> answersGiven;
  final List<String> correctAnswers;

  @override
  Widget build(BuildContext context) {
    final int nQuestions = questionOrder.length;

    return SizedBox(
      height: 400,
      // makes child widget scrollable
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < nQuestions; i++)
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  // make everything start at the top of the row
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (answersGiven[i] == correctAnswers[i])
                              ? const Color.fromARGB(170, 76, 175, 80)
                              : const Color.fromARGB(170, 244, 67, 54)),
                      child: Text(
                        (i + 1).toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // expanded makes the child widget take all the space it can get
                    // (but not more)
                    // the maximum width of a column is infinite
                    Expanded(
                      child: Column(
                        // make text align to the left
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            questions[questionOrder[i]].text,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            answersGiven[i],
                            style: TextStyle(
                                color: (answersGiven[i] == correctAnswers[i])
                                    ? Colors.green
                                    : Colors.red),
                          ),
                          const SizedBox(height: 5),
                          // if given answers incorrect, show correct answer in green
                          if (answersGiven[i] != correctAnswers[i])
                            Text(
                              correctAnswers[i],
                              style: const TextStyle(
                                color: Colors.green,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          const SizedBox(height: 5),
                        ],
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
