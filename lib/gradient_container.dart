// import 'package:first_app/styled_text.dart';
import 'package:first_app/dice_roller.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const Alignment startAlignment = Alignment.topLeft;
const Alignment endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,
    required this.colors,
  });

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: startAlignment,
          end: endAlignment,
          colors: colors,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}


// class GradientContainer extends StatelessWidget {
//   const GradientContainer({
//     super.key,
//     required this.colors,
//   });

//   final List<Color> colors;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: startAlignment,
//           end: endAlignment,
//           colors: colors,
//         ),
//       ),
//       child: const Center(
//         child: StyledText("flutdter.dev"),
//       ),
//     );
//   }
// }
