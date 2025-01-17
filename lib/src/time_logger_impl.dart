import 'package:jetlog/src/field.dart' show Field, Dur, DTM;
import 'package:jetlog/src/interface.dart';
import 'package:jetlog/src/level.dart';
import 'package:jetlog/src/time_logger.dart';

class TimeLoggerImpl implements TimeLogger {
  TimeLoggerImpl(this._context,
      {Level level = Level.debug, bool logTimerStart = false})
      : _timer = Stopwatch(),
        _level = level,
        _logTimerStart = logTimerStart;

  late final DateTime startAt;
  DateTime? stopAt;
  Interface _context;

  final Stopwatch _timer;
  final Level _level;
  final bool _logTimerStart;

  @pragma('vm:prefer-inline')
  void start(String message) {
    startAt = DateTime.now();
    _context = _context.bind({if (_logTimerStart) DTM('timerStart', startAt)})
      ..log(_level, message);

    _timer.start();
  }

  @override
  void stop(String message, {Level? level, Iterable<Field>? fields}) {
    if (_timer.isRunning) {
      _timer.stop();
      stopAt = DateTime.now();
      _context.bind({
        Dur('duration', _timer.elapsed),
        if (fields != null) ...fields
      }).log(level ?? _level, message);
    }
  }

  @override
  String toString() {
    final buffer = StringBuffer();

    buffer
      ..write('TimeLogger(')
      ..write('level=')
      ..write(_level)
      ..write(' ')
      ..write('isRunning=')
      ..write(_timer.isRunning)
      ..write(' ')
      ..write('startAt=')
      ..write(startAt.toString())
      ..write(' ')
      ..write('stopAt=')
      ..write(stopAt.toString())
      ..write(')');

    return buffer.toString();
  }
}
