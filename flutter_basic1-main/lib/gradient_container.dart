import 'package:flutter/material.dart';
import 'package:flutter_basic1/dice_roller.dart';

var startAligment = Alignment.topRight;
var endAligment = Alignment.bottomLeft;

class GradientContainer extends StatelessWidget {
  // const GradientContainer({super.key, required this.colors});
  const GradientContainer(this.color1, this.color2, {super.key});

  const GradientContainer.green({super.key})
      : color1 = Colors.greenAccent,
        color2 = Colors.green;

  // final List<Color> colors;
  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color1,
            color2,
          ],
          begin: startAligment,
          end: endAligment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
