import 'dart:convert';
import 'package:budget_app_larhmich/src/models/month_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('MonthModel', () {
    late List<dynamic> jsonData;

    setUpAll(() async {
      final String data = await rootBundle.loadString('lib/assets/data.json');
      jsonData = json.decode(data) as List<dynamic>;
    });

    test('can be initialized from JSON', () {
      final month = MonthModel.fromJson(jsonData[0]);

      expect(month.id, '2021-01');
      expect(month.name, 'January');
      expect(month.year, 2021);
      expect(month.expenses, {
        'Food': 100.0,
        'Transportation': 200.0,
        'Entertainment': 300.0,
        'Groceries': 400.0,
        'Other': 500.0,
      });
      expect(month.income, {
        'Salary': 1000.0,
        'Bonus': 2000.0,
        'Other': 3000.0,
      });
      expect(month.totalExpenses, 1500.0);
      expect(month.totalIncome, 6000.0);
      expect(month.total, 4500.0);
    });

    test('can be loaded from a JSON file', () async {
      final months = await MonthModel.loadFromJsonFile('lib/assets/data.json');

      expect(months.length, jsonData.length);

      for (var i = 0; i < jsonData.length; i++) {
        expect(months[i].id, jsonData[i]['id']);
        expect(months[i].name, jsonData[i]['name']);
        expect(months[i].year, jsonData[i]['year']);
        expect(months[i].expenses, jsonData[i]['expenses']);
        expect(months[i].income, jsonData[i]['income']);
        expect(months[i].totalExpenses, jsonData[i]['totalExpenses']);
        expect(months[i].totalIncome, jsonData[i]['totalIncome']);
        expect(months[i].total, jsonData[i]['total']);
      }
    });
  });
}
