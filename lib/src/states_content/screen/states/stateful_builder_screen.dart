import 'dart:developer';

import 'package:flutter/material.dart';

class StatefulBuilderScreen extends StatefulWidget {
  const StatefulBuilderScreen({super.key});

  @override
  State<StatefulBuilderScreen> createState() => _StatefulBuilderScreenState();
}

class _StatefulBuilderScreenState extends State<StatefulBuilderScreen> {
  bool _toggleSwitch = false;

  @override
  Widget build(BuildContext context) {
    log("Build");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text("Profile", style: Theme.of(context).textTheme.displaySmall),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Orders",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notifications",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  StatefulBuilder(
                    builder: (context, setState) => Switch(
                      activeColor: Colors.green,
                      value: _toggleSwitch,
                      onChanged: (value) =>
                          setState(() => _toggleSwitch = value),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
