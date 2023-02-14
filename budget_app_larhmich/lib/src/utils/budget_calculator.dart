import '../models/transaction_model.dart';

class BudgetCalculator {
  final List<TransactionModel> transactions;

  BudgetCalculator({required this.transactions});

  double get totalExpenses {
    return transactions
        .where((transaction) => transaction.type == TransactionType.expense)
        .map((transaction) => transaction.amount)
        .fold(0, (previousValue, currentValue) => previousValue + currentValue);
  }

  double get totalIncome {
    return transactions
        .where((transaction) => transaction.type == TransactionType.income)
        .map((transaction) => transaction.amount)
        .fold(0, (previousValue, currentValue) => previousValue + currentValue);
  }

  Map<String, double> expensesByCategory() {
    final expensesByCategory = <String, double>{};
    transactions
        .where((transaction) => transaction.type == TransactionType.expense)
        .forEach((transaction) {
      final category = transaction.category;
      final amount = transaction.amount;
      expensesByCategory[category] = expensesByCategory.containsKey(category)
          ? expensesByCategory[category]! + amount
          : amount;
    });
    return expensesByCategory;
  }

  Map<String, double> incomeByCategory() {
    final incomeByCategory = <String, double>{};
    transactions
        .where((transaction) => transaction.type == TransactionType.income)
        .forEach((transaction) {
      final category = transaction.category;
      final amount = transaction.amount;
      incomeByCategory[category] = incomeByCategory.containsKey(category)
          ? incomeByCategory[category]! + amount
          : amount;
    });
    return incomeByCategory;
  }
}
