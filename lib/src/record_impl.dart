import 'package:jetlog/src/field.dart';
import 'package:jetlog/src/level.dart';
import 'package:jetlog/src/record.dart';
import 'package:meta/meta.dart' show immutable;

@immutable
class RecordImpl implements Record {
  RecordImpl(
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

  Map<String, Field>? _fieldsByName;

  @override
  Field<T>? getField<T>(String name) {
    _fieldsByName ??= fields != null
        ? Map.fromEntries(fields!.map((f) => MapEntry(f.name, f)))
        : {};
    return _fieldsByName![name] as Field<T>?;
  }

  @override
  bool hasField(String name) => getField<dynamic>(name) != null;

  @override
  dynamic operator [](String name) => getField<dynamic>(name)?.value;
}
