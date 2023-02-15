import 'package:budget_app_larhmich/src/widgets/total_amount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TotalAmount displays correct difference text',
      (WidgetTester tester) async {
    final double income = 1000.0;
    final double expenses = 500.0;
    await tester.pumpWidget(TotalAmount(income: income, expenses: expenses));
    expect(find.text('-500.00'), findsOneWidget);
    final double newIncome = 2000.0;
    final double newExpenses = 2500.0;
    await tester
        .pumpWidget(TotalAmount(income: newIncome, expenses: newExpenses));
    expect(find.text('500.00'), findsOneWidget);
  });
}
