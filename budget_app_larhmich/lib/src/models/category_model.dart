import 'dart:math';

import 'package:flutter/material.dart';

class CategoryModel {
  String? id;
  String name;
  int budget;
  Color color;

  Color get getColor =>
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  CategoryModel(
      {this.id, required this.name, required this.budget, required this.color});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      budget: json['budget'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['budget'] = budget;
    data['color'] = color;
    return data;
  }
}
