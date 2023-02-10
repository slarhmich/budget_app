class CategoryModel {
  String? id;
  String name;
  int budget;

  CategoryModel({this.id, required this.name, required this.budget});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      budget: json['budget'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['budget'] = budget;
    return data;
  }
}
