import 'package:jetlog/src/field.dart' show Field;
import 'package:jetlog/src/handler.dart';
import 'package:jetlog/src/level.dart';
import 'package:jetlog/src/logger.dart';
import 'package:jetlog/src/time_logger.dart';

/// [Interface] represents a set of common methods that is implemented by both
/// [Logger] and logging context returned by [Interface.bind].
abstract class Interface {
  /// Emits a record with [message] and [level] severity level.
  ///
  /// If [error] and [stack] are provided, they will be added to the
  /// [Record] provided to the [Handler].
  ///
  /// If [level] is either [Level.all] or [Level.off] it will immediately
  /// throw [ArgumentError].
  void log(Level level, String message, [Object? error, StackTrace? stack]);

  /// Starts timing and emits a record with [message] and [level]
  /// severity level; to stop tracing call [TimeLogger.stop] on the returned
  /// timer.
  TimeLogger time(
    String message, {
    Level level = Level.debug,
    bool logTimerStart = false,
  });

  /// Creates and returns a new logging context with bound collection of
  /// [fields] added to existing one.
  ///
  /// Example:
  /// ```dart
  /// final context = logger.bind({
  ///   Str('username', 'vanesyan'),
  ///   Str('filename', 'avatar.png'),
  ///   Str('mime', 'image/png'),
  /// });
  ///
  /// final timer = context.time('Uploading!', Level.info);
  ///
  /// // Emulate uploading, wait for 1 sec.
  /// await Future<void>.delayed(const Duration(seconds: 1));
  ///
  /// timer.stop('Aborting...');
  /// context.fatal('Failed to upload!');
  /// ```
  ///
  /// It is possible to extend bound context with another fields.
  ///
  /// Example:
  /// ```dart
  /// var context = logger.bind({Str('first', '1st'}); // => { "first": "1st" }
  /// context = context.bind({Str('second', '2nd'}); // => { "first": "1st", "second": "2nd" }
  /// ```
  Interface bind([Iterable<Field>? fields]);
}
