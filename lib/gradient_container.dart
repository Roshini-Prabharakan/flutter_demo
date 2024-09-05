import 'package:flutter/material.dart';
import 'package:sample/dice_roller.dart';
//import 'package:sample/styleText.dart';

const startAlign = Alignment.topLeft;
const endAlign = Alignment.bottomRight;

class GradientContainter extends StatelessWidget {
  const GradientContainter(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;

  const GradientContainter.purple({super.key})
      : color1 = Colors.deepPurple,
        color2 = Colors.indigo;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlign,
          end: endAlign,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}



/*class GradientContainter extends StatelessWidget {
  const  GradientContainter({super.key,required this.colors});

  final List<Color> colors;
  @override
  Widget build(context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          colors: 
            colors,
          begin: startAlign,
          end: endAlign,
        ),
      ),
      child: const Center(
        child: StyleText('Hello World!!'),
      ),
    );
  }
}*/
