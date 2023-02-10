import 'package:budget_app_larhmich/src/models/category_model.dart';
import 'package:test/test.dart';

void main() {
  group('CategoryModel', () {
    test('fromJson should create a CategoryModel from Map<String, dynamic>',
        () {
      final Map<String, dynamic> json = {
        'id': '1',
        'name': 'Shopping',
        'budget': 500
      };
      final category = CategoryModel.fromJson(json);
      expect(category.id, '1');
      expect(category.name, 'Shopping');
      expect(category.budget, 500);
    });

    test('toJson should create Map<String, dynamic> from CategoryModel', () {
      final category = CategoryModel(id: '1', name: 'Shopping', budget: 500);
      final Map<String, dynamic> json = category.toJson();
      expect(json['id'], '1');
      expect(json['name'], 'Shopping');
      expect(json['budget'], 500);
    });
  });

  test('create instance without id', () {
    final category = CategoryModel(name: 'Shopping', budget: 500);
    final Map<String, dynamic> jsson = category.toJson();
    expect(jsson['id'], isNull);
    expect(jsson['name'], 'Shopping');
    expect(jsson['budget'], 500);
  });
}
