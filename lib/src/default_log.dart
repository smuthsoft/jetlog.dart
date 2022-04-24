import 'package:jetlog/src/field.dart';
import 'package:jetlog/src/interface.dart';
import 'package:jetlog/src/level.dart';

/// [DefaultLog] defines [Interface.log] aliases on [Interface] for some predefined [Level]s.
extension DefaultLog on Interface {
  /// Emits a record with [message] and [Level.trace] severity level.
  @pragma('vm:prefer-inline')
  void trace(String message,
          [Object? error, StackTrace? stack, Iterable<Field>? fields]) =>
      _loggerForFields(fields).log(Level.trace, message, error, stack);

  @pragma('vm:prefer-inline')
  void traceWithFields(String msg, [Iterable<Field>? fields]) =>
      _loggerForFields(fields).log(Level.trace, msg);

  /// Emits a record with [message] and [Level.debug] severity level.
  @pragma('vm:prefer-inline')
  void debug(String message,
          [Object? error, StackTrace? stack, Iterable<Field>? fields]) =>
      _loggerForFields(fields).log(Level.debug, message, error, stack);

  @pragma('vm:prefer-inline')
  void debugWithFields(String msg, [Iterable<Field>? fields]) =>
      _loggerForFields(fields).log(Level.debug, msg);

  /// Emits a record with [message] and [Level.info] severity level.
  @pragma('vm:prefer-inline')
  void info(String message,
          [Object? error, StackTrace? stack, Iterable<Field>? fields]) =>
      _loggerForFields(fields).log(Level.info, message, error, stack);

  @pragma('vm:prefer-inline')
  void infoWithFields(String msg, [Iterable<Field>? fields]) =>
      _loggerForFields(fields).log(Level.info, msg);

  /// Emits a record with [message] and [Level.warning] severity level.
  @pragma('vm:prefer-inline')
  void warning(String message,
          [Object? error, StackTrace? stack, Iterable<Field>? fields]) =>
      _loggerForFields(fields).log(Level.warning, message, error, stack);

  @pragma('vm:prefer-inline')
  void warningWithFields(String msg, [Iterable<Field>? fields]) =>
      _loggerForFields(fields).log(Level.warning, msg);

  /// Emits a record with [message] and [Level.error] severity level.
  @pragma('vm:prefer-inline')
  void error(String message,
          [Object? error, StackTrace? stack, Iterable<Field>? fields]) =>
      _loggerForFields(fields).log(Level.error, message, error, stack);

  /// Emits a record with [message] and [Level.fatal] severity level.
  @pragma('vm:prefer-inline')
  void fatal(String message,
          [Object? error, StackTrace? stack, Iterable<Field>? fields]) =>
      _loggerForFields(fields).log(Level.fatal, message, error, stack);

  @pragma('vm:prefer-inline')
  Interface _loggerForFields(Iterable<Field>? fields) =>
      fields != null ? bind(fields) : this;
}
