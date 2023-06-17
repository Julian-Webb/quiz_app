import 'package:flutter/material.dart';
import 'package:quiz_app/gradient_container.dart';

void main() {
  runApp(
    // MaterialApp is for apps that use Material Design (google's design system)
    const MaterialApp(
      title: 'Quiz App',
      home: Scaffold(
        body: GradientContainer(
          [Color.fromARGB(255, 97, 24, 110), Color.fromARGB(255, 60, 16, 68)],
        ),
      ),
    ),
  );
}
