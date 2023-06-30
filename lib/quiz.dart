import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/summary_screen.dart';

// should contain materialapp
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // the ? tells Dart that the variable may contain a Widget OR null
  Widget? currentScreen;

  // the following method is so that startQuiz is initialized before the
  // initialization of currentScreen
  // initState will execute *once* after the object has been created
  @override
  void initState() {
    currentScreen = StartScreen(startQuiz);
    super.initState();
  }

  void startQuiz() {
    // setState makes flutter rexecute the build method
    setState(
      () {
        currentScreen = QuestionsScreen(endQuiz);
      },
    );
  }

  void endQuiz(List<int> questionOrder, List<String> answersGiven,
      List<String> correctAnswers) {
    setState(
      () {
        currentScreen = SummaryScreen(
            questionOrder, answersGiven, correctAnswers, restartQuiz);
      },
    );
  }

  void restartQuiz() {
    setState(() {
      currentScreen = StartScreen(startQuiz);
    });
  }

  @override
  Widget build(context) {
    // MaterialApp is for apps that use Material Design (google's design system)
    return MaterialApp(
      // Scaffold will set up the screen that's displayed to the user
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 97, 24, 110),
              Color.fromARGB(255, 60, 16, 68),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
