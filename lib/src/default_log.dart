import 'package:jetlog/src/interface.dart';
import 'package:jetlog/src/level.dart';

/// [DefaultLog] defines [Interface.log] aliases on [Interface] for some predefined [Level]s.
extension DefaultLog on Interface {
  /// Emits a record with [message] and [Level.debug] severity level.
  @pragma('vm:prefer-inline')
  void debug(String message, [Object? error, StackTrace? stack]) =>
      log(Level.debug, message, error, stack);

  /// Emits a record with [message] and [Level.info] severity level.
  @pragma('vm:prefer-inline')
  void info(String message, [Object? error, StackTrace? stack]) =>
      log(Level.info, message, error, stack);

  /// Emits a record with [message] and [Level.warning] severity level.
  @pragma('vm:prefer-inline')
  void warning(String message, [Object? error, StackTrace? stack]) =>
      log(Level.warning, message, error, stack);

  /// Emits a record with [message] and [Level.error] severity level.
  @pragma('vm:prefer-inline')
  void error(String message, [Object? error, StackTrace? stack]) =>
      log(Level.error, message, error, stack);

  /// Emits a record with [message] and [Level.fatal] severity level.
  @pragma('vm:prefer-inline')
  void fatal(String message, [Object? error, StackTrace? stack]) =>
      log(Level.fatal, message, error, stack);
}
