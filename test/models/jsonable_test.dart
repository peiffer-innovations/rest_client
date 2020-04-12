import 'package:rest_client/rest_client.dart';
import 'package:test/test.dart';

void main() {
  test('Jsonable.parseBool', () {
    expect(false, Jsonable.parseBool('false'));
    expect(false, Jsonable.parseBool('FALSE'));
    expect(false, Jsonable.parseBool('NO'));
    expect(false, Jsonable.parseBool('no'));
    expect(false, Jsonable.parseBool(0));
    expect(false, Jsonable.parseBool(false));
    expect(false, Jsonable.parseBool(null));

    expect(true, Jsonable.parseBool('true'));
    expect(true, Jsonable.parseBool('TRUE'));
    expect(true, Jsonable.parseBool('YES'));
    expect(true, Jsonable.parseBool('yes'));
    expect(true, Jsonable.parseBool(1));
    expect(true, Jsonable.parseBool(true));
  });

  test('Jsonable.parseDouble', () {
    expect(null, Jsonable.parseDouble(null));
    expect(1.23, Jsonable.parseDouble(1.23));
    expect(1.23, Jsonable.parseDouble('1.23'));
    expect(1.0, Jsonable.parseDouble('1.0'));
    expect(1.0, Jsonable.parseDouble(1.0));
    expect(1.0, Jsonable.parseDouble(1));
  });

  test('Jsonable.parseDurationFromMillis', () {
    expect(null, Jsonable.parseDurationFromMillis(null));
    expect(Duration(milliseconds: 123), Jsonable.parseDurationFromMillis(123));
    expect(
      Duration(milliseconds: 123),
      Jsonable.parseDurationFromMillis(123.5),
    );
    expect(
      Duration(milliseconds: 123),
      Jsonable.parseDurationFromMillis('123'),
    );
    expect(
      Duration(milliseconds: 123),
      Jsonable.parseDurationFromMillis('123.5'),
    );
  });

  test('Jsonable.parseDurationFromSeconds', () {
    expect(null, Jsonable.parseDurationFromSeconds(null));
    expect(Duration(seconds: 123), Jsonable.parseDurationFromSeconds(123));
    expect(Duration(seconds: 123), Jsonable.parseDurationFromSeconds(123.5));
    expect(Duration(seconds: 123), Jsonable.parseDurationFromSeconds('123'));
    expect(Duration(seconds: 123), Jsonable.parseDurationFromSeconds('123.5'));
  });

  test('Jsonable.parseInt', () {
    expect(null, Jsonable.parseInt(null));
    expect(1, Jsonable.parseInt(1.23));
    expect(1, Jsonable.parseInt('1.23'));
    expect(1, Jsonable.parseInt('1.0'));
    expect(1, Jsonable.parseInt(1.0));
    expect(1, Jsonable.parseInt(1));
  });

  test('Jsonable.parseUtcMillis', () {
    const millis = 1586717564014;

    expect(null, Jsonable.parseDurationFromMillis(null));
    expect(millis, Jsonable.parseUtcMillis(millis).millisecondsSinceEpoch);
    expect(millis, Jsonable.parseUtcMillis('$millis').millisecondsSinceEpoch);
    expect(true, Jsonable.parseUtcMillis(millis).isUtc);
  });
}
