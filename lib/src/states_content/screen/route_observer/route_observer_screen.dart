import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:presentation_content/src/states_content/screen/route_observer/next_screen_route_observer.dart';
import 'package:presentation_content/src/states_content/screen/route_observer/utils/observer_utils.dart';

class RouteObserverScreen extends StatefulWidget {
  const RouteObserverScreen({super.key});

  @override
  State<RouteObserverScreen> createState() => _RouteObserverScreenState();
}

class _RouteObserverScreenState extends State<RouteObserverScreen>
    with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ObserverUtils.routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPush() {
    log("This Screen didPush");
  }

  @override
  void didPop() {
    log("This Screen didPop");
  }

  @override
  void didPushNext() {
    log("The Next Screen didPushNext");
  }

  @override
  void didPopNext() {
    log("The Next Screen didPopNext and returned to This Screen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "This is Route Observer Screen",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 12.0,
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const NextScreenRouteObserver(),
                ),
              ),
              child: Text(
                "Go To Next Screen",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
