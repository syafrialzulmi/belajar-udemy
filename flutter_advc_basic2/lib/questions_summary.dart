import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final isCorrectAnswer =
                data['correct_answer'] == data['user_answer'];
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isCorrectAnswer
                          ? const Color.fromARGB(255, 239, 188, 255)
                          : const Color.fromARGB(255, 62, 14, 70),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: GoogleFonts.acme(
                        fontSize: 18.0,
                        color: isCorrectAnswer
                            ? const Color.fromARGB(255, 62, 14, 70)
                            : const Color.fromARGB(255, 239, 188, 255),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.adamina(
                            fontSize: 16,
                            color: const Color.fromARGB(255, 62, 14, 70),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: GoogleFonts.acme(
                            fontSize: 18.0,
                            color: const Color.fromARGB(255, 239, 188, 255),
                          ),
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: GoogleFonts.acme(
                            fontSize: 18.0,
                            color: isCorrectAnswer
                                ? const Color.fromARGB(255, 239, 188, 255)
                                : const Color.fromARGB(255, 62, 14, 70),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
