import 'dart:developer';
import 'package:flutter/material.dart';
import '../models/month_model.dart';
import '../widgets/month_list.dart';

class PreviousMonthsView extends StatefulWidget {
  const PreviousMonthsView({Key? key}) : super(key: key);

  @override
  State createState() => _PreviousMonthsViewState();
}

class _PreviousMonthsViewState extends State<PreviousMonthsView> {
  late Future<List<MonthModel>> _monthsFuture;

  @override
  void initState() {
    super.initState();
    _monthsFuture = MonthModel.loadFromJsonFile('lib/assets/data.json');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Month List'),
      ),
      body: FutureBuilder<List<MonthModel>>(
        future: _monthsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MonthList(months: snapshot.data!);
          } else if (snapshot.hasError) {
            log(snapshot.error.toString());
            return Text('Error: ${snapshot.error}');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
