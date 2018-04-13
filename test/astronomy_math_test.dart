import 'package:test/test.dart';
import 'package:libpray/src/maths/astronomy_math.dart';
import 'package:libpray/src/models/high_latitude_adjustment.dart';

void testAstronomyMath() {
  group('astronomy_math tests.', () {
    // Test data:
    //   - Date: April 12th, 2018 at UTC.
    //   - Sunrise hour: 5.936050578361192.
    //   - Sunset hour: 18.09359586584113.
    // final DateTime date = new DateTime.utc(2018, 4, 12);
    const double jd = 2458220.2194444444;
    // const double sunrise = 5.936050578361192;
    // const double sunset = 18.09359586584113;
    const double sunsetToSunriseHour = 11.84245471252006; // sunrise - sunset

    _testGetDayFractionForPrayersDefaultTime();
    _testGetNightFraction(sunsetToSunriseHour);
    _testComputeSolarTimeForPrayersOnApril12th2018(jd);
    _testComputeSunDeclinationOnApril12th2018(jd);
    _testComputeMidDayOnApril12th2018(jd);
    _testComputeSunriseAngleAt2MetresAltitude();
  });
}

void _testGetDayFractionForPrayersDefaultTime() {
  test('Test get day fraction for imsak default time of 5.', () {
    expect((getDayFraction(5.0) - 0.20833333333333334).abs(), lessThan(1e-12));
  });
  test('Test get day fraction for fajr default time of 5.', () {
    expect((getDayFraction(5.0) - 0.20833333333333334).abs(), lessThan(1e-12));
  });
  test('Test get day fraction for sunrise default time of 6.', () {
    expect((getDayFraction(6.0) - 0.25).abs(), lessThan(1e-12));
  });
  test('Test get day fraction for dhuha default time of 12.', () {
    expect((getDayFraction(12.0) - 0.5).abs(), lessThan(1e-12));
  });
  test('Test get day fraction for asr default time of 13.', () {
    expect((getDayFraction(13.0) - 0.5416666666666666).abs(), lessThan(1e-12));
  });
  test('Test get day fraction for sunset default time of 18.', () {
    expect((getDayFraction(18.0) - 0.75).abs(), lessThan(1e-12));
  });
  test('Test get day fraction for maghrib default time of 18.', () {
    expect((getDayFraction(18.0) - 0.75).abs(), lessThan(1e-12));
  });
  test('Test get day fraction for isha default time of 18.', () {
    expect((getDayFraction(18.0) - 0.75).abs(), lessThan(1e-12));
  });
}

void _testGetNightFraction(double diff) {
  test('Test get night fraction for high latitude adjustment of none should throw error.', () {
    expect(() {
      getNightFraction(HighLatitudeAdjustment.none, null, null);
    }, throwsA(const isInstanceOf<ArgumentError>()));
  });

  test('Test get night fraction for high latitude adjustment of middle of night with diff $diff should equals 5.92122735626003.', () {
    expect((getNightFraction(HighLatitudeAdjustment.middleOfNight, null, diff) - 5.92122735626003).abs(), lessThan(1e-12));
  });

  test('Test get night fraction for high latitude adjustment of 1/7 of night with diff $diff should equals 1.691779244645723.', () {
    expect((getNightFraction(HighLatitudeAdjustment.oneSeventhOfNight, null, diff) - 1.691779244645723).abs(), lessThan(1e-12));
  });

  test('Test get night fraction for high latitude adjustment of angle-based with angle 20 and diff $diff should equals 3.9474849041733533.', () {
    expect((getNightFraction(HighLatitudeAdjustment.angleBased, 20.0, diff) - 3.9474849041733533).abs(), lessThan(1e-12));
  });
}

void _testComputeSolarTimeForPrayersOnApril12th2018(double jd) {
  test('Test compute solar time for fajr on April 12th, 2018.', () {
    expect((computeSolarTime(jd, 0.20833333333333334, 20.0, 2.0, Direction.counterClockwise) - 4.644572520441736).abs(), lessThan(1e-12));
  });
  test('Test compute solar time for isha on April 12th, 2018.', () {
    expect((computeSolarTime(jd, 0.75, 18.0, 2.0, Direction.clockwise) - 19.250576300230424).abs(), lessThan(1e-12));
  });
}

void _testComputeSunDeclinationOnApril12th2018(double jd) {
  test('Test compute sun declination on April 12th, 2018.', () {
    expect((computeSunDeclination(jd + 0.5416666666666666) - 8.680557660849296).abs(), lessThan(1e-12));
  });
}

void _testComputeMidDayOnApril12th2018(double jd) {
  test('Test compute mid day on April 12th, 2018.', () {
    expect((computeMidDay(jd, 0.5) - 12.014588571149947).abs(), lessThan(1e-12));
  });
}

void _testComputeSunriseAngleAt2MetresAltitude() {
  test('Test compute sunrise/sunset angle at elevation of 2 metres.', () {
    expect((computeSunriseAngle(2.0) - 0.8820732106143464).abs(), lessThan(1e-12));
  });
}
