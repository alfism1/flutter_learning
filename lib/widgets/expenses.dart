import 'package:first_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import 'package:first_app/widgets/expenses_list/expenses_list.dart';
import 'package:first_app/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 99.8,
      date: DateTime.now(),
      category: Category.bills,
    ),
    Expense(
      title: 'Hamburger and Fries',
      amount: 25.2,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Costume for Halloween',
      amount: 46.4,
      date: DateTime.now(),
      category: Category.clothes,
    ),
  ];

  void _openAddExpensesOverlay() async {
    var newExpenseObject = await showModalBottomSheet(
      context: context,
      isScrollControlled: true, // makes the modal full screen
      builder: (context) {
        return NewExpense(
          onAddExpense: addExpense,
        );
      },
    );

    addExpense(newExpenseObject);
  }

  void addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void deleteExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
      // _registeredExpenses.removeWhere((expense) => expense.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpensesOverlay,
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The chart'),
          // need Expanded to make the list scrollable
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
              onRemove: deleteExpense,
            ),
          ),
        ],
      ),
    );
  }
}
