class FeedbackModel {
  String id;
  String message;
  DateTime createdAt;

  FeedbackModel(
      {required this.id, required this.message, required this.createdAt});

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      id: json['id'],
      message: json['message'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    data['createdAt'] = createdAt.toIso8601String();
    return data;
  }
}
