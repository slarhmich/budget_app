// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'src/widgets/month_summary.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: Month()),
    );
  }
}
