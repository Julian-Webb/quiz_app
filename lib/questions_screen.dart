// return some text widget

import 'package:flutter/material.dart';

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
  @override
  build(context) {
    return const Text('Questions Screen');
  }
}
