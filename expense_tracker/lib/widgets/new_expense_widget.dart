import 'package:flutter/material.dart';

class NewExpenseWidget extends StatefulWidget {
  const NewExpenseWidget({super.key});

  @override
  State<NewExpenseWidget> createState() => _NewExpenseWidgetState();
}

class _NewExpenseWidgetState extends State<NewExpenseWidget> {
  // handles user input
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    // must tell flutter to delete this widget when no longer needed with this
// dispose method
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            cursorColor: Colors.blueGrey,
            autofocus: true,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            controller: _amountController,
            maxLength: 25,
            cursorColor: Colors.green,
            autofocus: true,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(label: Text('Amount')),
          ),
          Row(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(5.0),
                ),
                onPressed: () {
                  print(_titleController.text);
                },
                child: const Text('Save Title'),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(5.0),
                ),
                onPressed: () {
                  print(_amountController.text);
                },
                child: const Text('Save Amount'),
              ),
              const SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () {
                  print('object');
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
