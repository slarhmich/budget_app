import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/transaction_model.dart';

class TransactionAdmin {
  static final TransactionAdmin _instance = TransactionAdmin._internal();

  static Database? _database;

  factory TransactionAdmin() {
    return _instance;
  }

  TransactionAdmin._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final String path = join(await getDatabasesPath(), 'transactions.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE transactions(id TEXT PRIMARY KEY, name TEXT, type INTEGER, amount REAL, date TEXT, category TEXT)',
        );
      },
    );
  }

  Future<List<TransactionModel>> getTransactions() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('transactions');
    return List.generate(maps.length, (i) {
      return TransactionModel(
        id: maps[i]['id'],
        name: maps[i]['name'],
        type: TransactionType.values[maps[i]['type']],
        amount: maps[i]['amount'],
        date: DateTime.parse(maps[i]['date']),
        category: maps[i]['category'],
      );
    });
  }

  Future<void> insertTransaction(TransactionModel transaction) async {
    final Database db = await database;
    await db.insert(
      'transactions',
      transaction.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateTransaction(TransactionModel transaction) async {
    final Database db = await database;
    await db.update(
      'transactions',
      transaction.toJson(),
      where: 'id = ?',
      whereArgs: [transaction.id],
    );
  }

  Future<void> deleteTransaction(String id) async {
    final Database db = await database;
    await db.delete(
      'transactions',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAllTransactions() async {
    final Database db = await database;
    await db.delete('transactions');
  }
}
