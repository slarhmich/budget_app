import 'package:budget_app_larhmich/src/models/transaction_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Transaction', () {
    test('should be able to create an instance from JSON', () {
      final Map<String, dynamic> json = {
        'id': 'transaction_1',
        'type': 'expense',
        'amount': 100.0,
        'date': '2022-01-01T00:00:00.000',
        'category': 'shopping',
      };

      final transaction = Transaction.fromJson(json);

      expect(transaction.id, 'transaction_1');
      expect(transaction.type, 'expense');
      expect(transaction.amount, 100.0);
      expect(transaction.date, DateTime(2022, 01, 01));
      expect(transaction.category, 'shopping');
    });

    test('should be able to convert to JSON', () {
      final transaction = Transaction(
        id: 'transaction_1',
        type: 'expense',
        amount: 100.0,
        date: DateTime(2022, 01, 01),
        category: 'shopping',
      );

      final Map<String, dynamic> json = transaction.toJson();

      expect(json, {
        'id': 'transaction_1',
        'type': 'expense',
        'amount': 100.0,
        'date': '2022-01-01T00:00:00.000',
        'category': 'shopping',
      });
    });

    test('should be equal if all attributes are the same', () {
      final transaction1 = Transaction(
        id: 'transaction_1',
        type: 'expense',
        amount: 100.0,
        date: DateTime(2022, 01, 01),
        category: 'shopping',
      );
      final transaction2 = Transaction(
        id: 'transaction_1',
        type: 'expense',
        amount: 100.0,
        date: DateTime(2022, 01, 01),
        category: 'shopping',
      );

      expect(transaction1, transaction2);
    });

    test('should not be equal if attributes are different', () {
      final transaction1 = Transaction(
        id: 'transaction_1',
        type: 'expense',
        amount: 100.0,
        date: DateTime(2022, 01, 01),
        category: 'shopping',
      );
      final transaction2 = Transaction(
        id: 'transaction_2',
        type: 'expense',
        amount: 200.0,
        date: DateTime(2022, 01, 02),
        category: 'entertainment',
      );

      expect(transaction1, isNot(transaction2));
    });
  });
}
