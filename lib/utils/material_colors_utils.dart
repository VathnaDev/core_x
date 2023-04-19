import 'dart:math';

import 'package:flutter/material.dart';

const List<MaterialColor> primaries = <MaterialColor>[
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.yellow,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.brown,
  // The grey swatch is intentionally omitted because when picking a color
  // randomly from this list to colorize an application,
  //Colors. picking grey suddenly
  // makes the app look disabled.
  Colors.blueGrey,
];

class MaterailColorUtils {
  static MaterialColor get random =>
      primaries[Random().nextInt(primaries.length)];
}
