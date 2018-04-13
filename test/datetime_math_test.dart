import 'package:test/test.dart';
import 'package:libpray/src/maths/datetime_math.dart';

void testDateTimeMath() {
  group('datetime_math tests.', () {
    _testFixHourNegative36();
    _testFixHourNegative10();
    _testFixHourPositive10();
    _testFixHourPositive27();
    _testComputeDurationFrom10To23();
  });
}

void _testFixHourNegative36() {
  test('Test fix hour -36 to +12.', () {
    expect(fixHour(-36.0), equals(12.0));
  });
}

void _testFixHourNegative10() {
  test('Test fix hour -10 to +14.', () {
    expect(fixHour(-10.0), equals(14.0));
  });
}

void _testFixHourPositive10() {
  test('Test fix hour +10 should stay +10.', () {
    expect(fixHour(10.0), equals(10.0));
  });
}

void _testFixHourPositive27() {
  test('Test fix hour +27 to +3.', () {
    expect(fixHour(27.0), equals(3.0));
  });
}

void _testComputeDurationFrom10To23() {
  test('Test compute duration from hour 10 to 23 = 13.', () {
    expect(computeDuration(23.0, 10.0), equals(13.0));
  });
}
