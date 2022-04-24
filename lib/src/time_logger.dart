import 'package:jetlog/src/field.dart' show Field;
import 'package:jetlog/src/interface.dart';
import 'package:jetlog/src/level.dart' show Level;

/// [TimeLogger] is used to measure time between [Interface.time] and
/// [TimeLogger.stop] calls.
abstract class TimeLogger {
  /// Stops timing; immediately emits a record with a [message] and measured
  /// time.
  void stop(String message, {Level? level, Iterable<Field>? fields});
}
