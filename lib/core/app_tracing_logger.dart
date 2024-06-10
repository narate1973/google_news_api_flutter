
import 'dart:collection';

abstract class AppTracingLogger {
  const AppTracingLogger();

  static const AppTracingLogger _singleton = _AppTracingLoggerImpl();

  static AppTracingLogger get instance => _singleton;

  void pushNotifier(String value);

  String compress();
}

class _AppTracingLoggerImpl extends AppTracingLogger {
  const _AppTracingLoggerImpl();

  static const _fifoSize = 50;
  static int _counter = 0;

  /// string buffer
  static final _sb = Queue<String>();

  void _checkForRange() {
    if (_counter >= _fifoSize) {
      _sb.removeFirst();
    } else {
      _counter++;
    }
  }

  @override
  String compress() {
    final joinedTracing = _sb.join("\n");
    _counter = 0;
    _sb.clear();
    return joinedTracing;
  }

  @override
  void pushNotifier(String value) {
    _sb.add("<==== PushNotifier ====>\n$value\ntime : ${DateTime.now()}");
    _checkForRange();
  }
}
