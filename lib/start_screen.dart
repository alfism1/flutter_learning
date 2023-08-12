import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          Text(
            "Learn Flutter the fun way!!",
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 245, 229, 243),
              fontSize: 24,
            ),
            // style: TextStyle(
            //   color: const Color.fromARGB(255, 245, 229, 243),
            //   fontSize: 24,
            // ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              // side: const BorderSide(
              //   color: Color.fromARGB(255, 45, 6, 67),
              // ),
              // padding: const EdgeInsets.all(10),
            ),
            icon: const Icon(Icons.play_arrow),
            label: const Text(
              "Start Quiz",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
