import 'package:first_app/data/question.dart';
import 'package:first_app/questions_summary/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.selectedAnswers,
    required this.restartQuiz,
  });

  final List<String> selectedAnswers;
  final void Function() restartQuiz;

  // <Map<String, Object>> -> Map with String keys and Object values
  // List<Map<String, Object>> getSummaryData() {
  // get summaryData is equal to getSummaryData()
  List<Map<String, Object>> get summaryData {
    final summaryData = <Map<String, Object>>[];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summaryData.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": selectedAnswers[i],
      });
    }

    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    // final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    // .where is like filter in javascript, or array_filter in PHP
    final numCorrectQuestions = summaryData
        .where((data) => data["correct_answer"] == data["user_answer"])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You answered $numCorrectQuestions of $numTotalQuestions questions correctly!",
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 194, 135, 223),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: restartQuiz,
              icon: const Icon(Icons.refresh),
              label: const Text("Restart Quiz!"),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                // textStyle: const TextStyle(
                //   // fontSize: 18,
                //   fontWeight: FontWeight.bold,
                // ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
