import 'package:jetlog/src/field.dart' show Field;
import 'package:jetlog/src/interface.dart' show Interface;
import 'package:jetlog/src/level.dart' show Level;

/// Tracer is used to measure time between [Interface.trace] and [Tracer.stop]
/// calls.
abstract class Tracer {
  /// Stops tracing; immediately emits a record with a [message] and
  /// measured time, and optional [fields] list.
  ///
  /// An optional [level] may be provided to specify severity level
  /// of the record, otherwise the same severity level will be used
  /// that was provided to [Interface.trace] call.
  ///
  /// If [stop] is called more than once a [TracerStoppedError]
  /// will be raised.
  void stop(String message, {Level? level, Iterable<Field>? fields});
}
