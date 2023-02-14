import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:budget_app_larhmich/src/widgets/month_list.dart';
import 'package:budget_app_larhmich/src/models/month_model.dart';

void main() {
  testWidgets('MonthList displays the correct number of months',
      (WidgetTester tester) async {
    // create a list of month models to display
    final months = [
      MonthModel(
          id: '1',
          name: 'January',
          year: 2022,
          expenses: {},
          income: {},
          totalExpenses: 0,
          totalIncome: 0,
          total: 0),
      MonthModel(
          id: '2',
          name: 'February',
          year: 2022,
          expenses: {},
          income: {},
          totalExpenses: 0,
          totalIncome: 0,
          total: 0),
      MonthModel(
          id: '3',
          name: 'March',
          year: 2022,
          expenses: {},
          income: {},
          totalExpenses: 0,
          totalIncome: 0,
          total: 0),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MonthList(months: months),
        ),
      ),
    );

    expect(find.byType(ExpansionTile), findsNWidgets(3));
    expect(find.text('January 2022'), findsOneWidget);
    expect(find.text('February 2022'), findsOneWidget);
  });
}
