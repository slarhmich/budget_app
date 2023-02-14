import 'dart:convert';

import 'package:flutter/services.dart';

class MonthModel {
  final String id;
  final String name;
  final int year;
  final Map<String, double> expenses;
  final Map<String, double> income;
  final double totalExpenses;
  final double totalIncome;
  final double total;

  MonthModel({
    required this.id,
    required this.name,
    required this.year,
    required this.expenses,
    required this.income,
    required this.totalExpenses,
    required this.totalIncome,
    required this.total,
  });

  factory MonthModel.fromJson(Map<String, dynamic> json) {
    final expenses = (json['expenses'] as Map<String, dynamic>)
        .map((key, value) => MapEntry(key, double.parse(value.toString())));
    final income = (json['income'] as Map<String, dynamic>)
        .map((key, value) => MapEntry(key, double.parse(value.toString())));
    return MonthModel(
      id: json['id'],
      name: json['name'],
      year: json['year'],
      expenses: expenses,
      income: income,
      totalExpenses: json['totalExpenses'].toDouble(),
      totalIncome: json['totalIncome'].toDouble(),
      total: json['total'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'year': year,
      'expenses': expenses,
      'income': income,
      'totalExpenses': totalExpenses,
      'totalIncome': totalIncome,
      'total': total,
    };
  }

  static Future<List<MonthModel>> loadFromJsonFile(String filePath) async {
    final String data = await rootBundle.loadString(filePath);
    final jsonData = json.decode(data) as List<dynamic>;
    return jsonData.map((monthData) => MonthModel.fromJson(monthData)).toList();
  }
}
