import 'package:equatable/equatable.dart';

enum TransactionType {
  income,
  expense,
}

class TransactionModel extends Equatable {
  final String id;
  final String name;
  final TransactionType type;
  final double amount;
  final DateTime date;
  final String category;

  const TransactionModel({
    required this.name,
    required this.id,
    required this.type,
    required this.amount,
    required this.date,
    required this.category,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      name: json['name'],
      type: TransactionType.values[json['type']],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type.index;
    data['amount'] = amount;
    data['date'] = date.toIso8601String();
    data['category'] = category;
    return data;
  }

  TransactionModel copyWith({
    String? name,
    String? id,
    TransactionType? type,
    double? amount,
    DateTime? date,
    String? category,
  }) {
    return TransactionModel(
      name: name ?? this.name,
      id: id ?? this.id,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      category: category ?? this.category,
    );
  }

  @override
  List<Object> get props => [id, type, amount, date, category, name];
}
