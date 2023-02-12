import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:budget_app_larhmich/src/models/category_model.dart';
import 'package:budget_app_larhmich/src/widgets/legend.dart';

void main() {
  testWidgets('Legend widget displays categories correctly',
      (WidgetTester tester) async {
    final categories = [
      CategoryModel(id: '1', name: 'Food', color: Colors.red),
      CategoryModel(id: '1', name: 'Travel', color: Colors.blue),
      CategoryModel(id: '1', name: 'Entertainment', color: Colors.green),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Legend(categories: categories),
      ),
    );

    expect(find.text('Food'), findsOneWidget);
    expect(find.text('Travel'), findsOneWidget);
    expect(find.text('Entertainment'), findsOneWidget);
    expect(find.byType(Container), findsNWidgets(6));
  });
}
