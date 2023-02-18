import 'package:flutter/material.dart';

class TotalAmount extends StatelessWidget {
  final double income;
  final double expenses;

  const TotalAmount({Key? key, required this.income, required this.expenses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final difference = income - expenses;
    final isNegative = difference < 0;

    final status = isNegative ? '-' : '';
    final differenceText = difference.abs().toStringAsFixed(2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          '$status$differenceText',
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
