import 'package:budget_app_larhmich/src/models/transaction_model.dart';
import 'package:budget_app_larhmich/src/widgets/legend.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:async';

void main() {
  group('TransactionList', () {
    testWidgets('displays a loading indicator while waiting for the data',
        (tester) async {
      final StreamController<List<Transaction>> streamController =
          StreamController<List<Transaction>>();
      final Stream<List<Transaction>> transactions = streamController.stream;

      await tester.pumpWidget(MaterialApp(
        home: TransactionList(
          transactions: transactions,
        ),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('displays transactions', (tester) async {
      final StreamController<List<Transaction>> streamController =
          StreamController<List<Transaction>>();
      final Stream<List<Transaction>> transactions = streamController.stream;
      final List<Transaction> testTransactions = <Transaction>[
        Transaction(
          id: '1',
          amount: 10.0,
          date: DateTime.now(),
          category: 'shopping',
          type: TransactionType.expense,
        ),
        Transaction(
          id: '2',
          amount: 20.0,
          date: DateTime.now(),
          type: TransactionType.expense,
          category: 'shopping',
        ),
      ];

      await tester.pumpWidget(MaterialApp(
        home: TransactionList(
          transactions: transactions,
        ),
      ));

      streamController.add(testTransactions);
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('\$10.0'), findsOneWidget);
      expect(find.text('\$20.0'), findsOneWidget);
    });
  });
}
