import 'package:flutter/material.dart';
import 'package:quiz_app/home_screen.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  final List<Color> colors;

  const GradientContainer(this.colors, {super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            // makes the color gradient
            colors: colors,
            // make the gradient go from the top left to the bottom right
            begin: startAlignment,
            end: endAlignment),
      ),
      child: const Center(child: HomeScreen()),
    );
  }
}
