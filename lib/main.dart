import 'package:flutter/material.dart';
import 'package:presentation_content/src/main/main_content_screen.dart';
import 'package:presentation_content/src/states_content/screen/route_observer/utils/observer_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [ObserverUtils.routeObserver],
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0.0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.brown,
          primaryContainer: Colors.brown,
        ),
        useMaterial3: true,
      ),
      home: const MainContentScreen(),
    );
  }
}
