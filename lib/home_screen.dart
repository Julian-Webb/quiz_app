import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // this makes it vertically minimal
      children: [
        Image.asset('assets/images/quiz-logo.png', width: 300),
        const SizedBox(height: 50),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 106, 26, 121),
              foregroundColor: Colors.white),
          child: const Text('Start Quiz'),
        )
      ],
    );
  }
}
