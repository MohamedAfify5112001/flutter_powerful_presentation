import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:presentation_content/src/states_content/model/todo_model.dart';
import 'package:presentation_content/src/states_content/state/todo_provider_state.dart';
import 'package:http/http.dart' as http;

final class CounterProvider {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  ValueNotifier<int> get counterState => _counter;

  void decrement() =>
      _counter.value = _counter.value > 0 ? _counter.value - 1 : 0;

  void increment() => _counter.value += 1;
}

final class TodoProvider {
  final ValueNotifier<TodoProviderState> _todoScreenState =
      ValueNotifier(Idle());

  ValueNotifier<TodoProviderState> get todoScreenState => _todoScreenState;

  Future<void> getTodo() async {
    _todoScreenState.value = Loading();
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
      final todoListJson = jsonDecode(response.body) as List;
      if (todoListJson.isEmpty) {
        _todoScreenState.value = Empty();
        return;
      }
      final List<TodoModel> todos = todoListJson
          .map((remoteTodo) => TodoModel.fromJson(remoteTodo))
          .toList();
      _todoScreenState.value = Success(todos: todos);
    } catch (_) {
      _todoScreenState.value = Error(message: "Failed to fetch todos");
    }
  }
}
