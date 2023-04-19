import 'dart:developer';

import 'package:flutter/foundation.dart';

class Logger {
  static debug(dynamic value, {String tag = 'Logger'}) {
    if (kDebugMode) log("$tag : ${value.toString()}");
  }
}
