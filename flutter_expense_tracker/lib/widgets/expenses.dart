import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter_expense_tracker/models/expense.dart';
import 'package:flutter_expense_tracker/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Kursus Flutter',
      amount: 19.92,
      date: DateTime.now(),
      category: Category.luang,
    ),
    Expense(
      title: 'Bali',
      amount: 50.50,
      date: DateTime.now(),
      category: Category.perjalanan,
    ),
  ];

  void _openAddExpenseOverly() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return const NewExpense();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Flutter Expenses Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverly,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text("Chart area"),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
