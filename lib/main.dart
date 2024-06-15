// lib/main.dart

import 'package:flutter/material.dart';
import 'package:expense_tracker/screens/home_screen.dart';
import 'package:expense_tracker/screens/add_expense_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/addExpense': (context) => AddExpenseScreen(),
      },
    );
  }
}
