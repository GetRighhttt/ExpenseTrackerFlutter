import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class NewExpenseWidget extends StatefulWidget {
  const NewExpenseWidget({super.key});

  @override
  State<NewExpenseWidget> createState() => _NewExpenseWidgetState();
}

class _NewExpenseWidgetState extends State<NewExpenseWidget> {
  // handles user input
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  // date picker selected state variable and is nullable
  DateTime? _selectedDate;

  // set state for category dropdown
  Categories _selectedCategory = Categories.fun;

  @override
  void dispose() {
    // must tell flutter to delete this widget when no longer needed with this
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  // method to show the date picker dialog
  // async and await method that allows us to wait for the said value
  void _openDatePickerDialog() async {
    // initial date
    final now = DateTime.now();

    // first date
    final firstDate = DateTime(now.year - 2, now.month, now.day, now.hour);

    // waits for the result
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    // setting state with selected date
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 50,
        horizontal: 16,
      ),
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
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  maxLength: 25,
                  cursorColor: Colors.green,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No date selected'
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _openDatePickerDialog,
                      icon: const Icon(Icons.calendar_month_outlined),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                elevation: 10,
                value: _selectedCategory,
                hint: const Text('category'),
                icon: const Icon(Icons.arrow_drop_down_rounded),
                items: Categories.values
                    .map(
                      (cateogry) => DropdownMenuItem(
                        value: cateogry,
                        child: Text(
                          cateogry.name.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(2.0),
                ),
                onPressed: () {
                  print(_titleController.text);
                },
                child: const Text('Save Expense'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
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
