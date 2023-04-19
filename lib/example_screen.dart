import 'dart:developer';
import 'dart:isolate';

import 'package:core_x/extensions/context_utils.dart';
import 'package:core_x/widgets/dev/dev_text_button.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  bool isSwitchEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          DevTextButton(
            title: "Dev Gallery",
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}
