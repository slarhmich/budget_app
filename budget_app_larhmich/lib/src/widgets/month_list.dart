import 'package:flutter/material.dart';
import '../models/month_model.dart';

class MonthList extends StatelessWidget {
  final List<MonthModel> months;

  const MonthList({Key? key, required this.months}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: months.length,
      itemBuilder: (context, index) {
        return Month(month: months[index]);
      },
    );
  }
}

class Month extends StatelessWidget {
  final MonthModel month;
  final bool isExpanded;

  const Month({
    Key? key,
    required this.month,
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
