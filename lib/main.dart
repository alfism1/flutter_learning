import 'package:first_app/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: GradientContainer(
          colors: [
            Color.fromARGB(255, 25, 19, 32),
            Color.fromARGB(255, 9, 88, 82),
            Color.fromARGB(255, 149, 68, 242),
          ],
        ),
      ),
    ),
  );
}
