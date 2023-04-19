import 'dart:developer';

class Dev {
  static void logExecuteTime(Function fun) async {
    final stopWatch = Stopwatch()..start();
    await fun.call();
    log("Executed Time: ${stopWatch.elapsed} ~ ${stopWatch.elapsed.inSeconds}s ~ ${stopWatch.elapsed.inMilliseconds}ms");
  }
}
