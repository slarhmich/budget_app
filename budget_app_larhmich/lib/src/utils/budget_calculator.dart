import 'package:flutter/material.dart';

import '../models/transaction_model.dart';

class BudgetCalculator {
  final List<Transaction> transactions;

  BudgetCalculator({required this.transactions});

  double get totalExpenses {
    return transactions
        .where((transaction) => transaction.type == TransactionType.expense)
        .map((transaction) => transaction.amount)
        .fold(
            0.0, (previousValue, currentValue) => previousValue + currentValue);
  }

  double get totalIncome {
    return transactions
        .where((transaction) => transaction.type == TransactionType.income)
        .map((transaction) => transaction.amount)
        .fold(
            0.0, (previousValue, currentValue) => previousValue + currentValue);
  }

  Map<String, double> expensesByCategory() {
    final expensesByCategory = <String, double>{};
    transactions.forEach((transaction) {
      if (transaction.type == TransactionType.expense) {
        if (expensesByCategory.containsKey(transaction.category)) {
          expensesByCategory[transaction.category] += transaction.amount;
        } else {
          expensesByCategory[transaction.category] = transaction.amount;
        }
      }
    });
    return expensesByCategory;
  }

  Map<String, double> incomeByCategory() {
    final incomeByCategory = <String, double>{};
    transactions.forEach((transaction) {
      if (transaction.type == TransactionType.income) {
        if (incomeByCategory.containsKey(transaction.category)) {
          incomeByCategory[transaction.category] += transaction.amount;
        } else {
          incomeByCategory[transaction.category] = transaction.amount;
        }
      }
    });
    return incomeByCategory;
  }
}
