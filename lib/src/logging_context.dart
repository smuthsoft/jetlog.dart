import 'package:jetlog/src/field.dart';
import 'package:jetlog/src/interface.dart';
import 'package:jetlog/src/level.dart';
import 'package:jetlog/src/logger_impl.dart';
import 'package:jetlog/src/record_impl.dart';
import 'package:jetlog/src/time_logger.dart';
import 'package:jetlog/src/time_logger_impl.dart';

import 'zone_fields.dart';

class LoggingContext implements Interface {
  LoggingContext(this._logger, [this._fields = const {}]);

  final LoggerImpl _logger;
  final Set<Field> _fields;

  @override
  void log(Level level, String message, [Object? error, StackTrace? stack]) {
    if (_logger.isEnabledFor(level)) {
      final record = RecordImpl(
          name: _logger.name,
          timestamp: DateTime.now(),
          level: level,
          message: message,
          fields: _fields.followedBy(zoneFields).toSet(),
          error: error,
          stack: stack);

      _logger.add(record);
    }
  }

  @override
  @pragma('vm:prefer-inline')
  Interface bind([Iterable<Field>? fields]) => LoggingContext(_logger, {
        ...?fields,
        ..._fields,
      });

  @override
  TimeLogger time(String message, {Level level = Level.debug}) =>
      TimeLoggerImpl(this, level)..start(message);
}
