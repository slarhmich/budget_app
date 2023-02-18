import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction_model.dart';
import '../transaction_db/transaction_admin.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final TransactionDBAdmin _transactionDBAdmin = TransactionDBAdmin();
  final DateFormat _dateFormat = DateFormat.yMd();

  List<TransactionModel> _transactions = [];

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  void _initializeDatabase() async {
    await _transactionDBAdmin.initDatabase();
    _refreshTransactions();
  }

  void _refreshTransactions() async {
    final transactions = await _transactionDBAdmin.getTransactionsFromDB();
    setState(() {
      _transactions = transactions;
    });
  }

  void _addTransaction() async {
    final now = DateTime.now();
    final transaction = TransactionModel(
      id: now.toIso8601String(),
      name: 'New Transaction',
      type: TransactionType.expense,
      amount: 0,
      date: now,
      category: 'Other',
    );
    await _transactionDBAdmin.addToDB(transaction);
    _refreshTransactions();
  }

  void _editTransaction(TransactionModel transaction) async {
    final updatedTransaction = TransactionModel(
      id: transaction.id,
      name: transaction.name,
      type: transaction.type,
      amount: transaction.amount + 1,
      date: transaction.date,
      category: transaction.category,
    );
    await _transactionDBAdmin.editTransaction(updatedTransaction);
    _refreshTransactions();
  }

  void _removeTransaction(String transactionId) async {
    await _transactionDBAdmin.removeFromDB(transactionId);
    _refreshTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: ListView.builder(
        itemCount: _transactions.length,
        itemBuilder: (context, index) {
          final transaction = _transactions[index];
          return ListTile(
            title: Text(transaction.name),
            subtitle: Text(
                '${_dateFormat.format(transaction.date)} - ${transaction.amount.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _removeTransaction(transaction.id),
            ),
            onTap: () => _editTransaction(transaction),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTransaction,
        child: const Icon(Icons.add),
      ),
    );
  }
}
