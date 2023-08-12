import 'package:first_app/quiz.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Quiz();
  }
  // This widget is the root of your application.
}


// class GradientContainer extends StatelessWidget {
//   const GradientContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Color.fromARGB(255, 45, 6, 67),
//             Color.fromARGB(255, 99, 19, 142),
//           ],
//         ),
//       ),
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Image.asset("assets/images/quiz-logo.png", width: 250),
//             const SizedBox(height: 80),
//             const Text(
//               "Learn Flutter the fun way!",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//               ),
//             ),
//             const SizedBox(height: 40),
//             OutlinedButton(
//               onPressed: () {},
//               style: OutlinedButton.styleFrom(
//                   side: const BorderSide(color: Color.fromARGB(255, 45, 6, 67)),
//                   padding: const EdgeInsets.all(10)),
//               child: const Text(
//                 "Start Quiz",
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
