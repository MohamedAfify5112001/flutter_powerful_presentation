import 'package:flutter/material.dart';
import 'package:presentation_content/src/states_content/screen/states/todo_value_notifier_screen.dart';
import 'package:presentation_content/src/states_content/state/state_provider.dart';

class ValueNotifierScreen extends StatelessWidget {
  final CounterProvider counterProvider;

  const ValueNotifierScreen({super.key, required this.counterProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.data_array),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TodoValueNotifierScreen())),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ValueListenableBuilder(
                valueListenable: counterProvider.counterState,
                builder: (context, value, _) => Center(
                  child: Text(
                    value.toString(),
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => counterProvider.increment(),
                child: const Text("Increment"),
              ),
              ElevatedButton(
                onPressed: () => counterProvider.decrement(),
                child: const Text("Decrement"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
