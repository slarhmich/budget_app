import 'dart:math';
import 'package:flutter/material.dart';

import '../models/month_model.dart';

class ExpenseCategoryData {
  final String name;
  final double value;

  ExpenseCategoryData({required this.name, required this.value});
}

class ExpensePieChart extends StatelessWidget {
  const ExpensePieChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MonthModel>>(
      future: MonthModel.loadFromJsonFile('lib/assets/data.json'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final expenseData = <ExpenseCategoryData>[];
          for (final month in snapshot.data!) {
            for (final category in month.expenses.keys) {
              final existingData = expenseData.firstWhere(
                  (data) => data.name == category,
                  orElse: () => ExpenseCategoryData(name: category, value: 0));
              final value = month.expenses[category] ?? 0.0;
              final newData = ExpenseCategoryData(
                  name: category, value: existingData.value + value);
              expenseData.remove(existingData);
              expenseData.add(newData);
            }
          }
          return CustomPaint(
            size: const Size(200, 200),
            painter: PieChartPainter(data: expenseData),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class PieChartPainter extends CustomPainter {
  final List<ExpenseCategoryData> data;
  final _colors = const [
    Color.fromARGB(255, 130, 197, 251),
    Color.fromARGB(255, 194, 233, 196),
    Color.fromARGB(255, 247, 206, 203),
    Color.fromARGB(255, 242, 238, 205),
    Color.fromARGB(255, 221, 169, 230),
    Color.fromARGB(255, 239, 222, 197),
    Color.fromARGB(255, 194, 240, 236),
    Color.fromARGB(255, 224, 180, 194),
  ];

  PieChartPainter({required this.data});

  @override
  void paint(Canvas canvas, Size size) {
    double total = 0.0;
    for (final datum in data) {
      total += datum.value;
    }

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    double startAngle = -90;
    double endAngle;
    for (int i = 0; i < data.length; i++) {
      endAngle = startAngle + 360 * (data[i].value / total);
      final path = Path()
        ..moveTo(size.width / 2, size.height / 2)
        ..arcTo(
            rect, radians(startAngle), radians(endAngle - startAngle), false)
        ..close();
      final paint = Paint()..color = _colors[i % _colors.length];
      canvas.drawPath(path, paint);
      startAngle = endAngle;
    }
  }

  @override
  bool shouldRepaint(PieChartPainter oldDelegate) {
    return data != oldDelegate.data;
  }

  double radians(double degrees) {
    return degrees * pi / 180;
  }
}
