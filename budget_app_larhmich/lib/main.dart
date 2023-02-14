import 'package:flutter/material.dart';
import 'src/screens/previous_data_screen.dart';
import 'src/widgets/legend.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Month List Demo',
      home: Legend(
        categories: [],
      ),
    );
  }
}
