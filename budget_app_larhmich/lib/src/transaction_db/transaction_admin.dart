import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/transaction_model.dart';

class TransactionDBAdmin {
  static const String dbName = 'transaction.db';
  static const int dbVersion = 1;

  late final Database _database;
  Future<void> close() async {
    await _database.close();
  }

  Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), dbName),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE transactions(id TEXT PRIMARY KEY, name TEXT, type INTEGER, amount REAL, date TEXT, category TEXT)',
        );
      },
      version: dbVersion,
    );
  }

  Future<void> addToDB(TransactionModel transaction) async {
    await _database.insert(
      'transactions',
      transaction.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> removeFromDB(String transactionId) async {
    await _database.delete(
      'transactions',
      where: 'id = ?',
      whereArgs: [transactionId],
    );
  }

  Future<void> editTransaction(TransactionModel transaction) async {
    await _database.update(
      'transactions',
      transaction.toJson(),
      where: 'id = ?',
      whereArgs: [transaction.id],
    );
  }

  Future<List<TransactionModel>> getTransactionsFromDB() async {
    final List<Map<String, dynamic>> maps =
        await _database.query('transactions');

    return List.generate(maps.length, (i) {
      return TransactionModel.fromJson(maps[i]);
    });
  }
}
