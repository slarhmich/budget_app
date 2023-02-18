import 'package:budget_app_larhmich/src/widgets/total_amount.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TotalAmount displays correct difference text',
      (WidgetTester tester) async {
    const double income = 1000.0;
    const double expenses = 500.0;
    await tester
        .pumpWidget(const TotalAmount(income: income, expenses: expenses));
    expect(find.text('500.00'), findsOneWidget);
    const double newIncome = 2000.0;
    const double newExpenses = 2500.0;
    await tester.pumpWidget(
        const TotalAmount(income: newIncome, expenses: newExpenses));
    expect(find.text('-500.00'), findsOneWidget);
  });
}
