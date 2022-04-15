import 'dart:async';

import 'field.dart';

/// The zone values key used to store bound [Field]s
const _fieldsZoneKey = 'jetlog.fields';

/// Associates [fields] with every log record written in the execution of [body]
R runZonedWithLogFields<R>(
  R Function() body, {
  required Iterable<Field> fields,
  void Function(Object error, StackTrace stack)? onError,
}) =>
    runZonedGuarded(
      body,
      // ignore: only_throw_errors
      onError ?? (error, stack) => throw error,
      zoneValues: logFieldsForZoneValues(fields),
    )!;

/// Provided to the [zoneValues] parameter of [runZoned]
Map<Object?, Object?> logFieldsForZoneValues(Iterable<Field> fields) =>
    {_fieldsZoneKey: fields};

/// An iterable of [Field]s bound to the current zone
Iterable<Field> get zoneFields =>
    Zone.current[_fieldsZoneKey] as Iterable<Field>? ?? const [];
