class Month {
  final String id;
  final String name;
  final int year;
  final Map<String, double> expenses;
  final Map<String, double> income;
  final double totalExpenses;
  final double totalIncome;
  final double total;

  Month({
    required this.id,
    required this.name,
    required this.year,
    required this.expenses,
    required this.income,
    required this.totalExpenses,
    required this.totalIncome,
    required this.total,
  });

  factory Month.fromJson(Map<String, dynamic> json) {
    final expenses = (json['expenses'] as Map<String, double>)
        .map((key, value) => MapEntry(key, value.toDouble()));
    final income = (json['income'] as Map<String, double>)
        .map((key, value) => MapEntry(key, value.toDouble()));
    return Month(
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
}
