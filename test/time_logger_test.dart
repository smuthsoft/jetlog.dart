import 'package:jetlog/jetlog.dart' show Logger;
import 'package:jetlog/src/time_logger_impl.dart';
import 'package:test/test.dart';

void main() {
  group('TimeLogger', () {
    group('#toString', () {
      test('returns correct string representation', () {
        final l = Logger.detached();
        final t = l.time('start') as TimeLoggerImpl;

        expect(
            t.toString(),
            equals('TimeLogger(level=Level(name=DEBUG) '
                'isRunning=true '
                'startAt=${t.startAt} '
                'stopAt=${t.stopAt})'));

        t.stop('stop');

        expect(
            t.toString(),
            equals('TimeLogger(level=Level(name=DEBUG) '
                'isRunning=false '
                'startAt=${t.startAt} '
                'stopAt=${t.stopAt})'));
      });
    });
  });
}
