// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/screens/add_expense_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Expense> _expenses = [];

  double get totalExpenses =>
      _expenses.fold(0, (total, expense) => total + expense.amount);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: _expenses.isEmpty
          ? Center(
              child: Text('No expenses added yet'),
            )
          : ListView.builder(
              itemCount: _expenses.length,
              itemBuilder: (context, index) {
                final expense = _expenses[index];
                return ListTile(
                  title: Text(expense.title),
                  subtitle: Text(
                      '${expense.amount.toStringAsFixed(2)} on ${expense.date.toLocal()}'.split(' ')[0]),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddExpenseScreen(context);
        },
        tooltip: 'Add Expense',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Expenses:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '\$${totalExpenses.toStringAsFixed(2)}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToAddExpenseScreen(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/addExpense');
    if (result != null && result is Expense) {
      setState(() {
        _expenses.add(result);
      });
    }
  }
}
