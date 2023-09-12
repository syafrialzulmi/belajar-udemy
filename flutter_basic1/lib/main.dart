import 'package:flutter/material.dart';
import 'package:flutter_basic1/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 79, 200, 216),
          Color.fromARGB(255, 35, 131, 144),
        ),
      ),
    ),
  );
}
