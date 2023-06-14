import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class ExpenseTrackerPage extends StatefulWidget {
  const ExpenseTrackerPage({super.key});

  @override
  State<ExpenseTrackerPage> createState() => _ExpenseTrackerPageState();
}

class _ExpenseTrackerPageState extends State<ExpenseTrackerPage> {
  // dummy data for list of expenses
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Drinks',
      amount: 24.99,
      date: DateTime.now(),
      category: Categories.fun,
    ),
    Expense(
      title: 'Movies',
      amount: 100.00,
      date: DateTime.now(),
      category: Categories.leisure,
    ),
    Expense(
      title: 'Plane tickets',
      amount: 600.00,
      date: DateTime.now(),
      category: Categories.travel,
    ),
    Expense(
      title: 'Laptop',
      amount: 1500.00,
      date: DateTime.now(),
      category: Categories.work,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expense Tracker',
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Menu'),
                content: const Text(
                    'This button is usually used to open a drawer menu, however in this example we are not doing that yet...'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }, // open drawer when button is pressed
          icon: const Icon(
            Icons.menu,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Add'),
                  content: const Text(
                      'This button will be used to add some data to the screen.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            }, // show date picker when button is pressed
            icon: const Icon(
              Icons.add,
            ),
          ),
        ], // actions
      ),
      // start of the body of the main page
      // start of body of main page where we display all the relevant info
      body: const Column(
        children: [
          // output expenses in a list
        ],
      ),
    );
  }
}
