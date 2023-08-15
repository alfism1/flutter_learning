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

  void removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
      // _registeredExpenses.removeWhere((expense) => expense.id == id);
    });

    // show a snackbar to undo the deletion of the expense item
    // from the list of expenses in the app state (i.e. _registeredExpenses) and the UI (i.e. ExpensesList)
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense removed!'),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
            // addExpense(expense);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text(
        'No expenses added yet!',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemove: removeExpense,
      );
    }

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
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
