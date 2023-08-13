import 'package:flutter/material.dart';

import 'package:first_app/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // The TextEditingController is a widget that lets you control the text in a TextField.
  // It's useful when you want to read or change the text in a TextField.
  // In this case, we're using it to read the text in the TextField.
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime? selectedDate;
  Category? selectedCategory = Category.food;

  // The presentDatePicker method shows a date picker.
  // It's async because it uses the await keyword.
  void presentDatePicker() async {
    final now = DateTime.now();
    final firstData = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstData,
      lastDate: now,
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }

  void submitExpenseData() {
    // The tryParse method tries to convert a string to a number.
    final enteredAmount = double.tryParse(amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        selectedDate == null ||
        selectedCategory == null) {
      // show error message

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
              'Please make sure to enter valid title, amount, date, and category.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    // // The widget.onAddExpense method is the callback that we passed to the NewExpense widget.
    // // It's called when the user taps the Save Expense button.
    // widget.onAddExpense(
    //   Expense(
    //     title: titleController.text,
    //     amount: enteredAmount,
    //     date: selectedDate!,
    //     category: selectedCategory!,
    //   ),
    // );

    // The Navigator.of(context).pop() method closes the bottom sheet.
    // It also passes the expense object to the _openAddExpensesOverlay method.
    Navigator.of(context).pop(
      Expense(
        title: titleController.text,
        amount: enteredAmount,
        date: selectedDate!,
        category: selectedCategory!,
      ),
    );
  }

  // The dispose method is called when the widget is removed from the widget tree.
  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            maxLength: 50,
            // The decoration is a property that lets you customize the appearance of the input field.
            // The InputDecoration widget lets you customize the appearance of the input field.
            decoration: const InputDecoration(
              label: Text('Title'),
              // border: OutlineInputBorder(),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  // The decoration is a property that lets you customize the appearance of the input field.
                  // The InputDecoration widget lets you customize the appearance of the input field.
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                    // border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      selectedDate == null
                          ? 'No date chosen'
                          // selectedDate! - the ! tells Dart that selectedDate is not null
                          : formatter.format(selectedDate!),
                    ),
                    IconButton(
                      onPressed: presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              DropdownButton(
                value: selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    if (value == null) {
                      return;
                    }
                    selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel"),
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                onPressed: submitExpenseData,
                child: const Text("Save Expense"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
