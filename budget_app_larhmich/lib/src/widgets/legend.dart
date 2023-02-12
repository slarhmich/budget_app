import 'package:flutter/material.dart';
import 'package:budget_app_larhmich/src/models/category_model.dart';

class Legend extends StatelessWidget {
  final List<CategoryModel> categories;

  const Legend({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(5),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: category.color,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                category.name,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
