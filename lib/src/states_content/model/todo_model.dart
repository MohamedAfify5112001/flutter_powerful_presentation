final class TodoModel {
  final int id;
  final String title;

  TodoModel({
    required this.id,
    required this.title,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
    );
  }
}
