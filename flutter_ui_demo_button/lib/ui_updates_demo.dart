import 'package:flutter/material.dart';
import 'package:flutter_ui_demo_button/demo_buttons.dart';

class UiUpdatesDemo extends StatelessWidget {
  const UiUpdatesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Flutter Internals"),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Setiap pengembang Flutter harus memiliki pemahaman dasar tentang internal Flutter!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Apakah Anda memahami cara Flutter memperbarui UI",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DemoButtons(),
        ],
      ),
    );
  }
}
