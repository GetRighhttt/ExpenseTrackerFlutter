import 'package:expense_tracker/widgets/expenses_list_widget.dart';
import 'package:expense_tracker/widgets/new_expense_widget.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class ExpenseTrackerPage extends StatefulWidget {
  const ExpenseTrackerPage({super.key});

  @override
  State<ExpenseTrackerPage> createState() => _ExpenseTrackerPageState();
}

class _ExpenseTrackerPageState extends State<ExpenseTrackerPage> {
  // dummy data for list of expenses from our Expense model class
  // this data would usually be coming from a remote source however for now
  // it is ok to use dummy data that we create ourselves
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
  ];

// opens modal bottom sheet when the "+" button in clicked
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      // takes full screen size
      isScrollControlled: true,
      context: context,
      // pass in add expense to New Expense Widget
      builder: (BuildContext context) =>
          NewExpenseWidget(onAddExpense: _addExpense),
    );
  }

// adds a new expense to the listView of expenses
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expense Tracker',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
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
          },
          icon: const Icon(
            Icons.menu,
          ),
        ),
        actions: [
          IconButton(
            // call method to open modal sheet when button is pressed
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(
              Icons.add,
            ),
          ),
        ], // actions
      ),
      // start of the body of the main page
      body: Column(
        children: [
          // allows for nested list to be present and size the list
          Expanded(
            child: ExpenseListWidget(
              // display list of expenses from expenses_list_widget.dart
              expenses: _registeredExpenses,
            ),
          ),
        ],
      ),
    );
  }
}
