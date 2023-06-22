import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expenses/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseListWidget extends StatelessWidget {
  const ExpenseListWidget(
      {super.key, required this.expenses, required this.onDismissedExpense});

  final void Function(Expense expense) onDismissedExpense;

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    // create a scrollable list that builds the items when they are visible
    // basically lazily initializes a scrollable list
    return ListView.builder(
      itemCount: expenses.length, // get number of items in list
      // builds the list and improves performance using list view for a lot of
      // display one item per expense with ExpenseItemWWidget
      // also makes item dismissible
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(.80),
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onDismissedExpense(expenses[index]);
        },
        child: ExpenseItemWidget(
          expenses[index],
        ),
      ),
    );
  }
}
