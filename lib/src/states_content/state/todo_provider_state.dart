import 'package:presentation_content/src/states_content/model/todo_model.dart';

sealed class TodoProviderState {}

final class Idle extends TodoProviderState {}

final class Loading extends TodoProviderState {}

final class Error extends TodoProviderState {
  final String message;

  Error({required this.message});
}

final class Empty extends TodoProviderState {
  final String emptyMessage;

  Empty() : emptyMessage = "No data available";
}

final class Success extends TodoProviderState {
  final List<TodoModel> todos;

  Success({required this.todos});
}
