import 'package:test/test.dart';
import 'package:jetlog/jetlog.dart';

void main() {
  group('Field', () {
    group('Dur', () {
      test('Sets correct `FieldKind`', () {
        const field = Dur('Dur', Duration.zero);

        expect(field.kind, FieldKind.duration);
      });
    });

    group('Double', () {
      test('Sets correct `FieldKind`', () {
        const field = Double('Double', 0.2);

        expect(field.kind, FieldKind.double);
      });
    });

    group('Num', () {
      test('Sets correct `FieldKind`', () {
        const field = Num('Num', 10);

        expect(field.kind, FieldKind.number);
      });
    });

    group('Int', () {
      test('Sets correct `FieldKind`', () {
        const field = Int('Int', 12);

        expect(field.kind, FieldKind.integer);
      });
    });

    group('Str', () {
      test('Sets correct `FieldKind`', () {
        const field = Str('Str', 'str');

        expect(field.kind, FieldKind.string);
      });
    });

    group('Bool', () {
      test('Sets correct `FieldKind`', () {
        const field = Bool('Bool', false);

        expect(field.kind, FieldKind.boolean);
      });
    });

    group('DTM', () {
      test('Sets correct `FieldKind`', () {
        final field = DTM('DTM', DateTime.now());

        expect(field.kind, FieldKind.dateTime);
      });
    });

    group('Obj', () {
      test('Sets correct `FieldKind`', () {
        final field = Obj('Obj', null);

        expect(field.kind, FieldKind.object);
      });
    });
  });
}
