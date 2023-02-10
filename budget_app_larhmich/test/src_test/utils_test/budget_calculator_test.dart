import 'package:budget_app_larhmich/src/models/transaction_model.dart';
import 'package:budget_app_larhmich/src/utils/budget_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('BudgetCalculator', () {
    final transactions = [
      Transaction(
        id: '1',
        type: TransactionType.expense,
        amount: 100,
        date: DateTime(2022, 1, 1),
        category: 'Food',
      ),
      Transaction(
        id: '2',
        type: TransactionType.expense,
        amount: 200,
        date: DateTime(2022, 2, 1),
        category: 'Entertainment',
      ),
      Transaction(
        id: '3',
        type: TransactionType.income,
        amount: 500,
        date: DateTime(2022, 3, 1),
        category: 'Salary',
      ),
      Transaction(
        id: '4',
        type: TransactionType.income,
        amount: 300,
        date: DateTime(2022, 4, 1),
        category: 'Investment',
      ),
    ];
    final budgetCalculator = BudgetCalculator(transactions: transactions);

    test('totalExpenses', () {
      const expected = 300.0;
      final result = budgetCalculator.totalExpenses;
      expect(result, expected);
    });

    test('totalIncome', () {
      const expected = 800.0;
      final result = budgetCalculator.totalIncome;
      expect(result, expected);
    });

    test('expensesByCategory', () {
      final expected = {
        'Food': 100.0,
        'Entertainment': 200.0,
      };
      final result = budgetCalculator.expensesByCategory();
      expect(result, expected);
    });

    test('incomeByCategory', () {
      final expected = {
        'Salary': 500.0,
        'Investment': 300.0,
      };
      final result = budgetCalculator.incomeByCategory();
      expect(result, expected);
    });
  });
}
