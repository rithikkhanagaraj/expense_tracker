import 'package:flutter/material.dart';
import 'package:expense_tracker/helpers/db_helper.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseProvider with ChangeNotifier {
  List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  Future<void> fetchExpenses() async {
    _expenses = await DBHelper.dbHelper.getExpenses();
    notifyListeners();
  }

  Future<void> addExpense(Expense expense) async {
    await DBHelper.dbHelper.insertExpense(expense);
    await fetchExpenses();
  }

  Future<void> deleteExpense(int id) async {
    await DBHelper.dbHelper.deleteExpense(id);
    await fetchExpenses();
  }
}
