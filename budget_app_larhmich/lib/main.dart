import 'package:flutter/material.dart';

import 'src/widgets/total_amount.dart';
import 'src/widgets/transaction_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Month List Demo',
        home: Scaffold(
          body: TransactionList([]),
        ));
  }
}
