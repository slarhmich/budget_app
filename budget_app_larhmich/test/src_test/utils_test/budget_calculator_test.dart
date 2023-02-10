import 'package:budget_app_larhmich/src/models/transaction_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'budget_calculator.dart';

void main() {
  group('BudgetCalculator', () {
    final transactions = [
      Transaction(
          id: '1',
          type: TransactionType.expense,
          amount: 10.0,
          date: DateTime.now(),
          category: 'Food'),
      Transaction(
          id: '2',
          type: TransactionType.expense,
          amount: 20.0,
          date: DateTime.now(),
          category: 'Shopping'),
      Transaction(
          id: '3',
          type: TransactionType.income,
          amount: 30.0,
          date: DateTime.now(),
          category: 'Salary'),
      Transaction(
          id: '4',
          type: TransactionType.income,
          amount: 40.0,
          date: DateTime.now(),
          category: 'Investment'),
      Transaction(
          id: '5',
          type: TransactionType.expense,
          amount: 50.0,
          date: DateTime.now(),
          category: 'Food'),
    ];
    final budgetCalculator = BudgetCalculator(transactions: transactions);

    test('totalExpenses', () {
      expect(budgetCalculator.totalExpenses, 60.0);
    });

    test('totalIncome', () {
      expect(budgetCalculator.totalIncome, 70.0);
    });

    test('expensesByCategory', () {
      final expensesByCategory = budgetCalculator.expensesByCategory();
      expect(expensesByCategory['Food'], 60.0);
      expect(expensesByCategory['Shopping'], 20.0);
    });

    test('incomeByCategory', () {
      final incomeByCategory = budgetCalculator.incomeByCategory();
      expect(incomeByCategory['Salary'], 30.0);
      expect(incomeByCategory['Investment'], 40.0);
    });
  });
}
