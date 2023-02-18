import 'package:budget_app_larhmich/src/models/transaction_model.dart';
import 'package:test/test.dart';

void main() {
  group('Transaction', () {
    test('fromJson correctly converts JSON to Transaction instance', () {
      final json = {
        'name': 'Salary',
        'id': '1',
        'type': 0,
        'amount': 100.0,
        'date': '2022-01-01T00:00:00.000',
        'category': 'Salary',
      };
      final transaction = TransactionModel.fromJson(json);

      expect(transaction.id, '1');
      expect(transaction.name, 'Salary');
      expect(transaction.type, TransactionType.income);
      expect(transaction.amount, 100.0);
      expect(transaction.date, DateTime.parse('2022-01-01T00:00:00.000'));
      expect(transaction.category, 'Salary');
    });

    test('toJson correctly converts Transaction instance to JSON', () {
      final transaction = TransactionModel(
        id: '1',
        type: TransactionType.income,
        amount: 100.0,
        date: DateTime.parse('2022-01-01T00:00:00.000'),
        category: 'Salary',
        name: '',
      );
      final json = transaction.toJson();

      expect(json['id'], '1');
      expect(json['type'], 0);
      expect(json['amount'], 100.0);
      expect(json['date'], '2022-01-01T00:00:00.000');
      expect(json['category'], 'Salary');
    });

    test('== returns true when two transactions have the same properties', () {
      final transaction1 = TransactionModel(
        id: '1',
        type: TransactionType.income,
        amount: 100.0,
        date: DateTime.parse('2022-01-01T00:00:00.000'),
        category: 'Salary',
        name: 'Salary',
      );
      final transaction2 = TransactionModel(
        id: '1',
        type: TransactionType.income,
        amount: 100.0,
        date: DateTime.parse('2022-01-01T00:00:00.000'),
        category: 'Salary',
        name: 'Salary',
      );

      expect(transaction1 == transaction2, true);
    });

    test('== returns false when two transactions have different properties',
        () {
      final transaction1 = TransactionModel(
        id: '1',
        type: TransactionType.income,
        amount: 100.0,
        date: DateTime.parse('2022-01-01T00:00:00.000'),
        category: 'Salary',
        name: '',
      );
      final transaction2 = TransactionModel(
        id: '2',
        type: TransactionType.income,
        amount: 100.0,
        date: DateTime.parse('2022-01-01T00:00:00.000'),
        category: 'Salary',
        name: '',
      );

      expect(transaction1 == transaction2, false);
    });
  });
}
