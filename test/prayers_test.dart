import 'package:libpray/src/models/calculation_method.dart';
import 'package:libpray/src/models/location.dart';
import 'package:libpray/src/models/prayer_calculation_settings.dart';
import 'package:libpray/src/models/prayers.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void testPrayers() {
  group('prayers tests.', () {
    // Test data:
    //   - Date: April 12th, 2018 08:00 at UTC.
    //   - Coordinate: [2, 101, 2].
    //   - Time zone: UTC+08:00.
    final DateTime date = DateTime.utc(2018, 4, 12, 8, 0);
    final Geocoordinate geo = Geocoordinate((GeocoordinateBuilder b) => b
      ..latitude = 2.0
      ..longitude = 101.0
      ..altitude = 2.0);
    const double timeZone = 8.0;
    PrayerCalculationSettings settings = PrayerCalculationSettings.defaultSettings();
    settings = settings.rebuild((PrayerCalculationSettingsBuilder b) =>
        b..calculationMethod.replace(CalculationMethod.fromPreset(preset: CalculationMethodPreset.departmentOfIslamicAdvancementOfMalaysia)));
    final Clock clock = _createMockClock();

    _testGetPrayerTimesForApril12th2018(date, settings, geo, timeZone);
    _testGetPrayerTimesForToday(date, settings, geo, timeZone, clock);
    _testGetCurrentPrayerTime(date, settings, geo, timeZone, clock);
    _testGetNextPrayerTime(date, settings, geo, timeZone, clock);
    _testGetLaterPrayerTime(date, settings, geo, timeZone, clock);
    _testGetAfterLaterPrayerTime(date, settings, geo, timeZone, clock);
  });
}

Clock _createMockClock() {
  final Clock mockClock = _MockClock();
  when(mockClock.now()).thenReturn(DateTime.utc(2018, 4, 12));
  return mockClock;
}

void _testGetPrayerTimesForApril12th2018(DateTime date, PrayerCalculationSettings settings, Geocoordinate geo, double timeZone) {
  test('Test get 1-day prayer times at [2, 101, 2] using JAKIM on April 12th, 2018.', () {
    final Prayers prayers = Prayers.on(date: date, settings: settings, coordinate: geo, timeZone: timeZone);
    expect(prayers.imsak, equals(DateTime(2018, 4, 12, 5, 45)));
    expect(prayers.fajr, equals(DateTime(2018, 4, 12, 5, 55)));
    expect(prayers.sunrise, equals(DateTime(2018, 4, 12, 7, 13)));
    expect(prayers.dhuha, equals(DateTime(2018, 4, 12, 7, 38)));
    expect(prayers.dhuhr, equals(DateTime(2018, 4, 12, 13, 18)));
    expect(prayers.asr, equals(DateTime(2018, 4, 12, 16, 29)));
    expect(prayers.sunset, equals(DateTime(2018, 4, 12, 19, 22)));
    expect(prayers.maghrib, equals(DateTime(2018, 4, 12, 19, 23)));
    expect(prayers.isha, equals(DateTime(2018, 4, 12, 20, 32)));
    expect(prayers.midnight, equals(DateTime(2018, 4, 13, 1, 17)));
  });
}

void _testGetPrayerTimesForToday(DateTime date, PrayerCalculationSettings settings, Geocoordinate geo, double timeZone, Clock clock) {
  test('Test get today (mocked for April 12th, 2018) prayer times at [2, 101, 2] using JAKIM.', () {
    final Prayers prayers = Prayers.today(settings: settings, coordinate: geo, timeZone: timeZone, clock: clock);
    expect(prayers.imsak, equals(DateTime(2018, 4, 12, 5, 45)));
    expect(prayers.fajr, equals(DateTime(2018, 4, 12, 5, 55)));
    expect(prayers.sunrise, equals(DateTime(2018, 4, 12, 7, 13)));
    expect(prayers.dhuha, equals(DateTime(2018, 4, 12, 7, 38)));
    expect(prayers.dhuhr, equals(DateTime(2018, 4, 12, 13, 18)));
    expect(prayers.asr, equals(DateTime(2018, 4, 12, 16, 29)));
    expect(prayers.sunset, equals(DateTime(2018, 4, 12, 19, 22)));
    expect(prayers.maghrib, equals(DateTime(2018, 4, 12, 19, 23)));
    expect(prayers.isha, equals(DateTime(2018, 4, 12, 20, 32)));
    expect(prayers.midnight, equals(DateTime(2018, 4, 13, 1, 17)));
  });
}

void _testGetCurrentPrayerTime(DateTime date, PrayerCalculationSettings settings, Geocoordinate geo, double timeZone, Clock clock) {
  test('Test get current (mocked for April 12th, 2018) prayer time at [2, 101, 2] using JAKIM.', () {
    final Prayer prayer = Prayer.now(settings: settings, coordinate: geo, timeZone: timeZone, clock: clock);
    expect(prayer.type, equals(PrayerType.dhuha));
    expect(prayer.time, equals(DateTime(2018, 4, 12, 7, 38)));
  });
}

void _testGetNextPrayerTime(DateTime date, PrayerCalculationSettings settings, Geocoordinate geo, double timeZone, Clock clock) {
  test('Test get next (mocked for April 12th, 2018) prayer time at [2, 101, 2] using JAKIM.', () {
    final Prayer prayer = Prayer.next(settings: settings, coordinate: geo, timeZone: timeZone, clock: clock);
    expect(prayer.type, equals(PrayerType.dhuhr));
    expect(prayer.time, equals(DateTime(2018, 4, 12, 13, 18)));
  });
}

void _testGetLaterPrayerTime(DateTime date, PrayerCalculationSettings settings, Geocoordinate geo, double timeZone, Clock clock) {
  test('Test get later (mocked for April 12th, 2018) prayer time at [2, 101, 2] using JAKIM.', () {
    final Prayer prayer = Prayer.later(settings: settings, coordinate: geo, timeZone: timeZone, clock: clock);
    expect(prayer.type, equals(PrayerType.asr));
    expect(prayer.time, equals(DateTime(2018, 4, 12, 16, 29)));
  });
}

void _testGetAfterLaterPrayerTime(DateTime date, PrayerCalculationSettings settings, Geocoordinate geo, double timeZone, Clock clock) {
  test('Test get after later (mocked for April 12th, 2018) prayer time at [2, 101, 2] using JAKIM.', () {
    final Prayer prayer = Prayer.afterLater(settings: settings, coordinate: geo, timeZone: timeZone, clock: clock);
    expect(prayer.type, equals(PrayerType.maghrib));
    expect(prayer.time, equals(DateTime(2018, 4, 12, 19, 23)));
  });
}

class _MockClock extends Mock implements Clock {}
