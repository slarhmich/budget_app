import 'package:budget_app_larhmich/src/models/transaction_model.dart';
import 'package:budget_app_larhmich/src/transaction_db/transaction_admin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('TransactionAdmin', () {
    late TransactionAdmin admin;

    setUp(() async {
      admin = TransactionAdmin();
      final String path =
          join(await getDatabasesPath(), 'test_transactions.db');
      await deleteDatabase(path);
    });

    test('Inserts and retrieves transactions', () async {
      final transaction1 = TransactionModel(
        id: '1',
        name: 'Transaction 1',
        type: TransactionType.income,
        amount: 10.0,
        date: DateTime.now(),
        category: 'Category 1',
      );
      final transaction2 = TransactionModel(
        id: '2',
        name: 'Transaction 2',
        type: TransactionType.expense,
        amount: 5.0,
        date: DateTime.now(),
        category: 'Category 2',
      );

      await admin.insertTransaction(transaction1);
      await admin.insertTransaction(transaction2);

      final transactions = await admin.getTransactions();
      expect(transactions.length, 2);
      expect(transactions[0].name, transaction1.name);
      expect(transactions[1].name, transaction2.name);
    });

    test('Updates transactions', () async {
      final transaction = TransactionModel(
        id: '1',
        name: 'Transaction 1',
        type: TransactionType.income,
        amount: 10.0,
        date: DateTime.now(),
        category: 'Category 1',
      );

      await admin.insertTransaction(transaction);

      final updatedTransaction = transaction.copyWith(name: 'New Name');
      await admin.updateTransaction(updatedTransaction);

      final transactions = await admin.getTransactions();
      expect(transactions.length, 1);
      expect(transactions[0].name, 'New Name');
    });

    test('Deletes transactions', () async {
      final transaction = TransactionModel(
        id: '1',
        name: 'Transaction 1',
        type: TransactionType.income,
        amount: 10.0,
        date: DateTime.now(),
        category: 'Category 1',
      );

      await admin.insertTransaction(transaction);
      await admin.deleteTransaction(transaction.id);

      final transactions = await admin.getTransactions();
      expect(transactions.length, 0);
    });

    test('Deletes all transactions', () async {
      final transaction1 = TransactionModel(
        id: '1',
        name: 'Transaction 1',
        type: TransactionType.income,
        amount: 10.0,
        date: DateTime.now(),
        category: 'Category 1',
      );
      final transaction2 = TransactionModel(
        id: '2',
        name: 'Transaction 2',
        type: TransactionType.expense,
        amount: 5.0,
        date: DateTime.now(),
        category: 'Category 2',
      );

      await admin.insertTransaction(transaction1);
      await admin.insertTransaction(transaction2);

      await admin.deleteAllTransactions();

      final transactions = await admin.getTransactions();
      expect(transactions.length, 0);
    });
  });
}
