import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

// creates expense to be displayed in the list
class ExpenseItemWidget extends StatelessWidget {
  const ExpenseItemWidget(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // using themes to style text
              expense.title,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                const Spacer(), // adds space between columns and rows
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]?.icon),
                    const SizedBox(width: 8),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
