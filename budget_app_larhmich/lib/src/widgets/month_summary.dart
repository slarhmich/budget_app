import 'package:flutter/material.dart';
import '../models/month_model.dart';

Map<String, dynamic> data = {
  "id": "2021-01",
  "name": "January",
  "year": 2021,
  "expenses": {
    "Food": 100.0,
    "Transportation": 200.0,
    "Entertainment": 300.0,
    "Groceries": 400.0,
    "Other": 500.0,
  },
  "income": {
    "Salary": 1000.0,
    "Bonus": 2000.0,
    "Other": 3000.0,
  },
  "totalExpenses": 1500.0,
  "totalIncome": 6000.0,
  "total": 4500.0,
};

class Month extends StatelessWidget {
  final MonthModel month = MonthModel.fromJson(data);
  final bool isExpanded;

  Month({
    Key? key,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      key: PageStorageKey<String>(month.id),
      title: Text("${month.name} ${month.year}"),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Expenses"),
              const SizedBox(height: 8),
              DataTable(
                columns: const [
                  DataColumn(label: Text("Category")),
                  DataColumn(label: Text("Total")),
                ],
                rows: month.expenses.entries
                    .map((expense) => DataRow(cells: [
                          DataCell(Text(expense.key)),
                          DataCell(Text("\$${expense.value}")),
                        ]))
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
