import 'package:budget_app_larhmich/src/models/transaction_model.dart';
import 'package:test/test.dart';

void main() {
  group('Transaction', () {
    test('fromJson correctly converts JSON to Transaction instance', () {
      final json = {
        'id': 1,
        'type': 0,
        'amount': 100.0,
        'date': '2022-01-01T00:00:00.000',
        'category': 'Salary',
      };
      final transaction = Transaction.fromJson(json);

      expect(transaction.id, 1);
      expect(transaction.type, TransactionType.income);
      expect(transaction.amount, 100.0);
      expect(transaction.date, DateTime.parse('2022-01-01T00:00:00.000'));
      expect(transaction.category, 'Salary');
    });

    test('toJson correctly converts Transaction instance to JSON', () {
      final transaction = Transaction(
        id: 1,
        type: TransactionType.income,
        amount: 100.0,
        date: DateTime.parse('2022-01-01T00:00:00.000'),
        category: 'Salary',
      );
      final json = transaction.toJson();

      expect(json['id'], 1);
      expect(json['type'], 0);
      expect(json['amount'], 100.0);
      expect(json['date'], '2022-01-01T00:00:00.000');
      expect(json['category'], 'Salary');
    });

    test('== returns true when two transactions have the same properties', () {
      final transaction1 = Transaction(
        id: 1,
        type: TransactionType.income,
        amount: 100.0,
        date: DateTime.parse('2022-01-01T00:00:00.000'),
        category: 'Salary',
      );
      final transaction2 = Transaction(
        id: 1,
        type: TransactionType.income,
        amount: 100.0,
        date: DateTime.parse('2022-01-01T00:00:00.000'),
        category: 'Salary',
      );

      expect(transaction1 == transaction2, true);
    });

    test('== returns false when two transactions have different properties',
        () {
      final transaction1 = Transaction(
        id: 1,
        type: TransactionType.income,
        amount: 100.0,
        date: DateTime.parse('2022-01-01T00:00:00.000'),
        category: 'Salary',
      );
      final transaction2 = Transaction(
        id: 2,
        type: TransactionType.income,
        amount: 100.0,
        date: DateTime.parse('2022-01-01T00:00:00.000'),
        category: 'Salary',
      );

      expect(transaction1 == transaction2, false);
    });
  });
}
