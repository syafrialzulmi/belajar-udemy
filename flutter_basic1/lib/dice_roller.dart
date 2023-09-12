import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_basic1/styled_text.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  // var activeDiceImage = "assets/images/dice-6.png";
  var currentDiceRoll = 1;

  void rollDice() {
    setState(() {
      // activeDiceImage = "assets/images/dice-1.png";
      currentDiceRoll = randomizer.nextInt(6) + 1; // (0 s/d 5) + 1
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        StyledText("I'am Jony, Hello world! $currentDiceRoll"),
        const SizedBox(
          height: 20,
        ),
        Image.asset(
          "assets/images/dice-$currentDiceRoll.png",
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: const TextStyle(
                fontSize: 28,
              )),
          child: const Text("Roll Dice"),
        ),
      ],
    );
  }
}
