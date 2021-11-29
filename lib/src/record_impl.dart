import 'package:jetlog/src/field.dart';
import 'package:jetlog/src/level.dart';
import 'package:jetlog/src/record.dart';
import 'package:meta/meta.dart' show immutable;

@immutable
class RecordImpl implements Record {
  const RecordImpl(
      {required this.level,
      required this.timestamp,
      required this.message,
      this.fields,
      this.name,
      this.error,
      this.stack});

  @override
  final Level level;

  @override
  final String message;

  @override
  final String? name;

  @override
  final DateTime timestamp;

  @override
  final Iterable<Field>? fields;

  @override
  final Object? error;

  @override
  final StackTrace? stack;
}
