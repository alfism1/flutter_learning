import 'package:flutter/material.dart';

import 'package:first_app/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Tutorial',
      theme: ThemeData(useMaterial3: true),
      home: const Expenses(),
    ),
  );
}
