import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// creating an instance of our Uuid 3rd party library
const uuid = Uuid();

// enum class to hold specific types of categories
enum Categories { food, travel, leisure, work, fun, hobbies }

// const map that should map categories to icons that should be displayed
const categoryIcons = {
  Categories.food: Icon(Icons.food_bank),
  Categories.travel: Icon(Icons.flight_takeoff),
  Categories.leisure: Icon(Icons.movie_edit),
  Categories.work: Icon(Icons.work),
  Categories.fun: Icon(Icons.local_drink_sharp),
  Categories.hobbies: Icon(Icons.sports_basketball),
};

// use intl package to format data with utility formatting object
final formatter = DateFormat.yMd();

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;

  // enum class instance created
  final Categories category;

  // getter that returns formatted date from intl package
  String get formattedDate {
    return formatter.format(date);
  }
}

// necessary to create buckets for the summed up data of the chart
class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  // alternative named constructor, used to add additoinal constructors to classes
  // used to get all expenses and filter list by category
  // where is used to filter elements in a list
  // checking to see if the category for the expense list is equal
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Categories category;
  final List<Expense> expenses;

// sums up all the expenses in the application
  double get totalExpenses {
    double sum = 0;

    // set sum = sum + expense amount
    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
