import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// The DateFormat is a part of the intl package.
// The DateFormat class lets you format dates.
// The DateFormat.yMd() method formats dates in the format MM/DD/YYYY.
final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, bills, clothes, game, other }

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.bills: Icons.money,
  Category.clothes: Icons.shopping_bag,
  Category.game: Icons.movie,
  Category.other: Icons.category,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
