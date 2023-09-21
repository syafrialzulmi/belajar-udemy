import 'package:flutter/material.dart';
import 'package:flutter_ui_demo_button/ui_updates_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const UiUpdatesDemo(),
    );
  }
}
