import 'package:flutter/material.dart';
import 'package:presentation_content/src/states_content/screen/states/stateful_builder_screen.dart';
import 'package:presentation_content/src/states_content/screen/states/value_notifier_screen.dart';
import 'package:presentation_content/src/states_content/state/state_provider.dart';

class StateContentScreen extends StatelessWidget {
  const StateContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ValueNotifierScreen(
                    counterProvider: CounterProvider(),
                  ),
                ),
              ),
              child: Text(
                "ValueNotifier",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StatefulBuilderScreen(),
                ),
              ),
              child: Text(
                "StatefulBuilder",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
