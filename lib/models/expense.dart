// lib/models/expense.dart

class Expense {
  final int? id;
  final String title;
  final double amount;
  final DateTime date;

  Expense({this.id, required this.title, required this.amount, required this.date});
}
