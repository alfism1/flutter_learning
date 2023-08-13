import 'package:flutter/material.dart';

import 'package:first_app/models/expense.dart';
import 'package:first_app/widgets/expenses_list/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemove});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemove;

  @override
  Widget build(BuildContext context) {
    /* 
      Use ListView instead of Column.
      The reason is that ListView will give better performance rather than Column.
      The ListView widget displays a scrollable list of items.
      ListView.builder is a widget that builds a list of items lazily.
      It's useful when you have a large number of items, and you don't want to
      create them all at once.
      The itemBuilder is a function that takes a context and an index, and
      returns a widget.
      The itemCount is the number of items in the list.
     */
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: Key(expenses[index].id),
        child: ExpenseItem(expenses[index]),
        onDismissed: (direction) {
          onRemove(expenses[index]);
        },
      ),
    );
  }
}
