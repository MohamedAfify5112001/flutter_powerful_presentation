import 'package:flutter/material.dart';

class NextScreenRouteObserver extends StatelessWidget {
  const NextScreenRouteObserver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "This is Next Screen",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
