import 'package:flutter/material.dart';

extension ContextRoute on BuildContext {
  to(Widget child) {
    Navigator.of(this).push(
      MaterialPageRoute(
        builder: (context) => child,
      ),
    );
  }
}
