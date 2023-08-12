import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.questionIndex,
    required this.isCorrect,
  });

  final int questionIndex;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    final String questionNumber = (questionIndex + 1).toString();
    return Container(
      alignment: Alignment.center,
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: isCorrect
            ? const Color.fromARGB(255, 73, 206, 243)
            : const Color.fromARGB(255, 230, 123, 246),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNumber,
        style: const TextStyle(
          // fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
