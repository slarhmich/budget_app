import 'dart:developer';

import 'package:flutter/material.dart';
import '../models/transaction_model.dart';
import '../utils/form_transaction.dart';

class TransactionListScreen extends StatefulWidget {
  const TransactionListScreen({Key? key}) : super(key: key);

  @override
  State createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  List<TransactionModel>? _transactionList;

  @override
  void initState() {
    super.initState();
    _getTransactions();
  }

  void _showAddTransactionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Transaction'),
          content: TransactionForm(
            onSubmit: (transaction) async {
              final transactionDBAdmin = TransactionDBAdmin.instance;
              await transactionDBAdmin.addTransaction(transaction);
              _getTransactions();
            },
          ),
        );
      },
    );
  }

  Future<void> _getTransactions() async {
    final transactionDBAdmin = TransactionDBAdmin.instance;
    final transactions = await transactionDBAdmin.getAllTransactions();
    setState(() {
      _transactionList = transactions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _transactionList != null && _transactionList!.isNotEmpty
          ? ListView.builder(
              itemCount: _transactionList!.length,
              itemBuilder: (BuildContext context, int index) {
                final transaction = _transactionList![index];
                return ListTile(
                  title: Text(transaction.name),
                  subtitle: Text(
                      '${transaction.type == TransactionType.income ? '+' : '-'}\$${transaction.amount.toStringAsFixed(2)}'),
                  trailing: Text(transaction.date.toString().substring(0, 10)),
                );
              },
            )
          : const Center(
              child: Text('No transactions yet'),
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            log(_transactionList!.length.toString());
            _showAddTransactionDialog();
          },
          child: const Text('Add Transaction'),
        ),
      ),
    );
  }
}
