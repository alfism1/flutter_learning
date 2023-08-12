import 'package:first_app/questions_summary/questions_identifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({
    super.key,
    required this.data,
  });

  // <Map<String, Object>> -> Map with String keys and Object values
  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
              questionIndex: data["question_index"] as int,
              isCorrect: data["correct_answer"] == data["user_answer"]),
          const SizedBox(width: 20),
          // Expanded -> takes as much space as possible available screen and restricts widgets to outside of the screen
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data["question"] as String,
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 248, 192, 242),
                  ),
                  // style: const TextStyle(
                  //   fontSize: 16,
                  //   fontWeight: FontWeight.bold,
                  //   color: Color.fromARGB(255, 248, 192, 242),
                  // ),
                ),
                const SizedBox(height: 5),
                Text(
                  data["user_answer"] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 194, 135, 223),
                  ),
                ),
                Text(
                  data["correct_answer"] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 135, 144, 223),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
