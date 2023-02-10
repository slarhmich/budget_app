import 'package:budget_app_larhmich/src/models/feedback_model.dart';
import 'package:test/test.dart';

void main() {
  test('Test FeedbackModel properties', () {
    const id = '123';
    const message = 'Test message';
    final createdAt = DateTime.now();

    final feedback =
        FeedbackModel(id: id, message: message, createdAt: createdAt);

    expect(feedback.id, id);
    expect(feedback.message, message);
    expect(feedback.createdAt, createdAt);
  });

  test('Test FeedbackModel fromJson', () {
    final json = {
      'id': '123',
      'message': 'Test message',
      'createdAt': '2022-01-01T00:00:00.000',
    };

    final feedback = FeedbackModel.fromJson(json);

    expect(feedback.id, json['id']);
    expect(feedback.message, json['message']);
    expect(feedback.createdAt, DateTime.parse(json['createdAt']!));
  });

  test('Test FeedbackModel toJson', () {
    const id = '123';
    const message = 'Test message';
    final createdAt = DateTime.parse('2022-01-01T00:00:00.000');

    final feedback =
        FeedbackModel(id: id, message: message, createdAt: createdAt);
    final json = feedback.toJson();

    expect(json['id'], id);
    expect(json['message'], message);
    expect(json['createdAt'], '2022-01-01T00:00:00.000');
  });
}
