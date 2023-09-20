import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/widgets/chart/chart.dart';
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
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Kegiatan telah dihapus"),
        action: SnackBarAction(
          label: "Kembali",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;

    // print(width);
    // print(height);

    Widget mainContent = const Center(
      child: Text("Tidak ada data kegiatan. Mohon diisi kembali."),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

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
      body: width < 600
          ? Column(
              children: [
                Chart(
                  expenses: _registeredExpenses,
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(
                    expenses: _registeredExpenses,
                  ),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
