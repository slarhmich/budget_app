import 'package:flutter/material.dart';
import 'src/widgets/transaction_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Month List Demo',
        home: Scaffold(
          body: TransactionScreen(),
        ));
  }
}
