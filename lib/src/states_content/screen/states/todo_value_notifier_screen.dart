import 'package:flutter/material.dart';
import 'package:presentation_content/src/states_content/model/todo_model.dart';
import 'package:presentation_content/src/states_content/state/state_provider.dart';
import 'package:presentation_content/src/states_content/state/todo_provider_state.dart';

class TodoValueNotifierScreen extends StatefulWidget {
  const TodoValueNotifierScreen({super.key});

  @override
  State<TodoValueNotifierScreen> createState() =>
      _TodoValueNotifierScreenState();
}

class _TodoValueNotifierScreenState extends State<TodoValueNotifierScreen> {
  final TodoProvider _todoProvider = TodoProvider();

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await _todoProvider.getTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: _todoProvider.todoScreenState,
          builder: (context, value, _) {
            return switch (value) {
              Loading() => const Center(
                  child: CircularProgressIndicator(),
                ),
              Error(:final message) => Center(
                  child: Text(message),
                ),
              Empty(:final emptyMessage) => Center(
                  child: Text(emptyMessage),
                ),
              Success(:final List<TodoModel> todos) => ListView.separated(
                  padding: const EdgeInsets.all(8.0),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(todos[index].title),
                    );
                  },
                  itemCount: todos.length,
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                ),
              _ => const Center(
                  child: Text("Something went wrong"),
                ),
            };
          },
        ),
      ),
    );
  }
}
