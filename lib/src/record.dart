import 'package:jetlog/src/field.dart' show Field;
import 'package:jetlog/src/level.dart';
import 'package:jetlog/src/logger.dart';

/// A single record emitted by a [Logger].
abstract class Record {
  /// Severity level of this record.
  Level get level;

  /// A message.
  String get message;

  /// Name of the logger this record originally emitted by.
  ///
  /// If the logger has no name, may be omitted.
  String? get name;

  /// Time when this record was created.
  DateTime get timestamp;

  /// A set of fields bound to the logging context.
  ///
  /// May be omitted if no fields are bound to the logging context.
  Iterable<Field>? get fields;

  /// The error associated with the log record, or `null` if none.
  Object? get error;

  /// The stack trace associated with the log record's [error], or `null` if none.
  StackTrace? get stack;
}
