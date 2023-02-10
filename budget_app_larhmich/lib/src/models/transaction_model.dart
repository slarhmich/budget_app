enum TransactionType {
  income,
  expense,
}

class Transaction {
  String id;
  TransactionType type;
  double amount;
  DateTime date;
  String category;

  Transaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.date,
    required this.category,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      type: TransactionType.values[json['type']],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type.index;
    data['amount'] = amount;
    data['date'] = date.toIso8601String();
    data['category'] = category;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final Transaction otherTransaction = other as Transaction;
    return id == otherTransaction.id &&
        type == otherTransaction.type &&
        amount == otherTransaction.amount &&
        date == otherTransaction.date &&
        category == otherTransaction.category;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      type.hashCode ^
      amount.hashCode ^
      date.hashCode ^
      category.hashCode;

  List<Object> get props => [id, type, amount, date, category];
}
