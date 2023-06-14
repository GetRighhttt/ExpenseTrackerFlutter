import 'package:flutter/material.dart';

class ExpenseTrackerPage extends StatefulWidget {
  const ExpenseTrackerPage({super.key});

  @override
  State<ExpenseTrackerPage> createState() => _ExpenseTrackerPageState();
}

class _ExpenseTrackerPageState extends State<ExpenseTrackerPage> {
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
            onPressed: () {}, // show date picker when button is pressed
            icon: const Icon(
              Icons.add,
            ),
          ),
        ], // actions
      ),
      // start of body of main page where we display all the relevant info
      body: const Column(
        children: [
          // Add in more data to use for this page
        ],
      ),
    );
  }
}
