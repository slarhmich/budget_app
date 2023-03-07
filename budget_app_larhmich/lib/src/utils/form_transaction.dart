import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

class TransactionForm extends StatefulWidget {
  final Function(TransactionModel) onSubmit;

  const TransactionForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();
  TransactionType _transactionType = TransactionType.expense;

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Amount',
            ),
            validator: (value) {
              if (value == null || double.tryParse(value) == null) {
                return 'Please enter a valid amount';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _categoryController,
            decoration: const InputDecoration(
              labelText: 'Category',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a category';
              }
              return null;
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                value: TransactionType.expense,
                groupValue: _transactionType,
                onChanged: (value) {
                  setState(() {
                    _transactionType = value as TransactionType;
                  });
                },
              ),
              const Text('Expense'),
              Radio(
                value: TransactionType.income,
                groupValue: _transactionType,
                onChanged: (value) {
                  setState(() {
                    _transactionType = value as TransactionType;
                  });
                },
              ),
              const Text('Income'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  final transaction = TransactionModel(
                    id: UniqueKey().toString(),
                    name: _nameController.text,
                    type: _transactionType,
                    amount: double.parse(_amountController.text),
                    date: DateTime.now(),
                    category: _categoryController.text,
                  );
                  await widget.onSubmit(transaction);
                  _nameController.clear();
                  _amountController.clear();
                  _categoryController.clear();
                  _transactionType = TransactionType.expense;
                  _formKey.currentState!.reset();
                  if (mounted) Navigator.of(context).pop();
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
