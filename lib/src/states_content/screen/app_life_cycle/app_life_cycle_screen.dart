import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:presentation_content/src/states_content/screen/app_life_cycle/video_life_cycle_screen.dart';

class AppLifeCycleScreen extends StatefulWidget {
  const AppLifeCycleScreen({super.key});

  @override
  State<AppLifeCycleScreen> createState() => _AppLifeCycleScreenState();
}

class _AppLifeCycleScreenState extends State<AppLifeCycleScreen> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(
      onStateChange: _onStateChanged,
    );
  }

  @override
  void dispose() {
    // Do not forget to dispose the listener
    _listener.dispose();
    super.dispose();
  }

  // Listen to the app lifecycle state changes
  void _onStateChanged(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        _onDetached();
        break;
      case AppLifecycleState.resumed:
        _onResumed();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
        _onBackground();
        break;
    }
  }

  void _onDetached() => log('detached');

  void _onResumed() => log('resumed');

  void _onBackground() => log('App in background');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const VideoLifeCycleScreen(),
                  ),
                ),
                child: const Text("Track Video LifeCycle"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
