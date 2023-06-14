import 'package:uuid/uuid.dart';

// creating an instance of our Uuid 3rd party library
const uuid = Uuid();

// enum class to hold specific types of categories
enum Categories { food, travel, leisure, work, fun, hobbies }

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
}
