import 'package:flutter/material.dart';
import 'src/widgets/pie_chart.dart';
import 'src/screens/pie_chart_screen.dart';
import 'src/screens/previous_data_screen.dart';
import 'src/widgets/legend.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

final data = {
  'Apples': 15.0,
  'Oranges': 20.0,
  'Bananas': 30.0,
  'Pears': 10.0,
  'Pineapples': 25.0,
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Month List Demo', home: ExpensePieChart());
  }
}
