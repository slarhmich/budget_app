import 'package:budget_app_larhmich/src/widgets/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ExpensePieChart displays correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const ExpensePieChart());

    // Expect exactly one CustomPaint widget in the widget tree
    expect(find.byType(CustomPaint), findsOneWidget);

    // Wait for the FutureBuilder to complete
    await tester.pumpAndSettle();

    // Expect exactly one CustomPaint widget in the widget tree
    expect(find.byType(CustomPaint), findsOneWidget);

// Ensure that the chart is drawn and that there are 4 slices.
    expect(find.byType(CustomPaint), findsOneWidget);
    CustomPaint chart = tester.widget(find.byType(CustomPaint));
    PieChartPainter painter = chart.painter as PieChartPainter;
    expect(painter.data.length, 5);

    // Ensure that the category names and values are as expected.
    expect(painter.data[0].name, 'Food');
    expect(painter.data[0].value, 1300.0);
    expect(painter.data[1].name, 'Transportation');
    expect(painter.data[1].value, 1900.0);
    expect(painter.data[2].name, 'Entertainment');
    expect(painter.data[2].value, 2500.0);
    expect(painter.data[3].name, 'Groceries');
    expect(painter.data[3].value, 3100.0);
    expect(painter.data[4].name, 'Other');
    expect(painter.data[4].value, 3700.0);
  });
}
