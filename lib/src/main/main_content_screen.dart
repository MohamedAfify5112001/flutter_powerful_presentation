import 'package:flutter/material.dart';
import 'package:presentation_content/src/states_content/screen/app_life_cycle/app_life_cycle_screen.dart';
import 'package:presentation_content/src/states_content/screen/route_observer/route_observer_screen.dart';
import 'package:presentation_content/src/states_content/screen/states/state_content_screen.dart';

class MainContentScreen extends StatelessWidget {
  const MainContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Main Content",
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const StateContentScreen(),
                  ),
                );
              },
              child: const Text(
                "States Content",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RouteObserverScreen(),
                ),
              ),
              child: const Text(
                "Routes Observer",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AppLifeCycleScreen(),
                  ),
                );
              },
              child: const Text(
                "App LifeCycle",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
