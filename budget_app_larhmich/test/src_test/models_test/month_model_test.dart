// import 'package:budget_app_larhmich/src/models/month_model.dart';
// import 'package:test/test.dart';

// void main() {
//   test('Test Month fromJson', () {
//     const id = '123';
//     const name = 'January';
//     const year = 2022;
//     final expenses = {'Rent': 1000.0, 'Food': 500.0};
//     final income = {'Salary': 2500.0};
//     const totalExpenses = 1500.0;
//     const totalIncome = 2500.0;
//     const total = totalIncome - totalExpenses;

//     final json = {
//       'id': id,
//       'name': name,
//       'year': year,
//       'expenses': expenses,
//       'income': income,
//       'totalExpenses': totalExpenses,
//       'totalIncome': totalIncome,
//       'total': total,
//     };

//     final month = Month.fromJson(json);

//     expect(month.id, id);
//     expect(month.name, name);
//     expect(month.year, year);
//     expect(month.expenses, expenses);
//     expect(month.income, income);
//     expect(month.totalExpenses, totalExpenses);
//     expect(month.totalIncome, totalIncome);
//     expect(month.total, total);
//   });

//   test('Test Month toJson', () {
//     const id = '123';
//     const name = 'January';
//     const year = 2022;
//     final expenses = {'Rent': 1000.0, 'Food': 500.0};
//     final income = {'Salary': 2500.0};
//     const totalExpenses = 1500.0;
//     const totalIncome = 2500.0;
//     const total = totalIncome - totalExpenses;

//     final month = Month(
//       id: id,
//       name: name,
//       year: year,
//       expenses: expenses,
//       income: income,
//       totalExpenses: totalExpenses,
//       totalIncome: totalIncome,
//       total: total,
//     );

//     final json = month.toJson();

//     expect(json['id'], id);
//     expect(json['name'], name);
//     expect(json['year'], year);
//     expect(json['expenses'], expenses);
//     expect(json['income'], income);
//     expect(json['totalExpenses'], totalExpenses);
//     expect(json['totalIncome'], totalIncome);
//     expect(json['total'], total);
//   });
// }
