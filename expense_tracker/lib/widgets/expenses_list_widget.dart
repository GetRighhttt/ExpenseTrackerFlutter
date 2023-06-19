import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseListWidget extends StatelessWidget {
  const ExpenseListWidget({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    // create a scrollable list that builds the items when they are visible
    // basically lazily initializes a scrollable list
    return ListView.builder(
      itemCount: expenses.length, // get number of items in list
      // builds the list and improves performance using list view for a lot of
      // items
      itemBuilder: (context, index) => ExpenseItemWidget(
        expenses[index],
      ),
    );
  }
}
