import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:libcalendar/libcalendar.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import '../maths/angle_math.dart';
import '../maths/astronomy_math.dart';
import '../maths/datetime_math.dart';
import 'calculation_method.dart';
import 'high_latitude_adjustment.dart';
import 'location.dart';
import 'prayer_calculation_settings.dart';

part 'prayers.g.dart';

///
/// Prayer times data for a single day.
///
abstract class Prayers implements Built<Prayers, PrayersBuilder> {
  // ---------------------------- CONSTRUCTORS ----------------------------

  ///
  /// Create [Prayers].
  ///
  factory Prayers([updates(PrayersBuilder b)]) = _$Prayers;

  ///
  /// Create [Prayers].
  ///
  Prayers._();

  ///
  /// Create [Prayers].
  ///
  factory Prayers.today(
      {@required PrayerCalculationSettings settings,
      @required Geocoordinate coordinate,
      @required double timeZone,
      Clock clock = const Clock()}) {
    final DateTime now = clock.now();
    return _PrayerCalculator.getPrayerTimesForOneDay(
        now, settings, coordinate, timeZone);
  }

  ///
  /// Create [Prayers].
  ///
  factory Prayers.on(
      {@required DateTime date,
      @required PrayerCalculationSettings settings,
      @required Geocoordinate coordinate,
      @required double timeZone}) {
    return _PrayerCalculator.getPrayerTimesForOneDay(
        date, settings, coordinate, timeZone);
  }

  // ----------------------------- SERIALIZER -----------------------------

  /// [Serializer] for this object.
  static Serializer<Prayers> get serializer => _$prayersSerializer;

  // ----------------------------- PROPERTIES -----------------------------

  /// Imsak prayer time.
  DateTime get imsak;

  /// Fajr prayer time.
  DateTime get fajr;

  /// Sunrise prayer time.
  DateTime get sunrise;

  /// Dhuha prayer time.
  DateTime get dhuha;

  /// Dhuhr prayer time.
  DateTime get dhuhr;

  /// Asr prayer time.
  DateTime get asr;

  /// Sunset time.
  DateTime get sunset;

  /// Maghrib prayer time.
  DateTime get maghrib;

  /// Isha prayer time.
  DateTime get isha;

  /// Midnight time.
  DateTime get midnight;
}

///
/// Data for a particular prayer.
///
abstract class Prayer implements Built<Prayer, PrayerBuilder> {
  // ---------------------------- CONSTRUCTORS ----------------------------

  ///
  /// Create [Prayer].
  ///
  factory Prayer([updates(PrayerBuilder b)]) = _$Prayer;

  ///
  /// Create [Prayer].
  ///
  Prayer._();

  ///
  /// Create [Prayer].
  ///
  factory Prayer.now(
      {@required PrayerCalculationSettings settings,
      @required Geocoordinate coordinate,
      @required double timeZone,
      Clock clock = const Clock()}) {
    return _PrayerCalculator.getCurrentPrayerTime(
        clock, settings, coordinate, timeZone);
  }

  ///
  /// Create [Prayer].
  ///
  factory Prayer.next(
      {@required PrayerCalculationSettings settings,
      @required Geocoordinate coordinate,
      @required double timeZone,
      Clock clock = const Clock()}) {
    return _PrayerCalculator.getNextPrayerTime(
        clock, settings, coordinate, timeZone);
  }

  ///
  /// Create [Prayer].
  ///
  factory Prayer.later(
      {@required PrayerCalculationSettings settings,
      @required Geocoordinate coordinate,
      @required double timeZone,
      Clock clock = const Clock()}) {
    return _PrayerCalculator.getLaterPrayerTime(
        clock, settings, coordinate, timeZone);
  }

  ///
  /// Create [Prayer].
  ///
  factory Prayer.afterLater(
      {@required PrayerCalculationSettings settings,
      @required Geocoordinate coordinate,
      @required double timeZone,
      Clock clock = const Clock()}) {
    return _PrayerCalculator.getAfterLaterPrayerTime(
        clock, settings, coordinate, timeZone);
  }

  // ----------------------------- SERIALIZER -----------------------------

  /// [Serializer] for this object.
  static Serializer<Prayer> get serializer => _$prayerSerializer;

  // ----------------------------- PROPERTIES -----------------------------

  /// Prayer type.
  PrayerType get type;

  /// Prayer time.
  DateTime get time;
}

///
/// Type of prayer.
///
class PrayerType extends EnumClass {
  // --------------------------- ENUM CONSTANTS ---------------------------

  /// Imsak prayer type.
  static const PrayerType imsak = _$imsak;

  /// Fajr prayer type.
  static const PrayerType fajr = _$fajr;

  /// Sunrise prayer type.
  static const PrayerType sunrise = _$sunrise;

  /// Dhuha prayer type.
  static const PrayerType dhuha = _$dhuha;

  /// Dhuhr prayer type.
  static const PrayerType dhuhr = _$dhuhr;

  /// Asr prayer type.
  static const PrayerType asr = _$asr;

  /// Maghrib prayer type.
  static const PrayerType maghrib = _$maghrib;

  /// Isha prayer type.
  static const PrayerType isha = _$isha;

  // ---------------------------- CONSTRUCTORS ----------------------------

  ///
  /// Create [PrayerType].
  ///
  const PrayerType._(String name) : super(name);

  // ----------------------------- PROPERTIES -----------------------------

  /// All valid values for [PrayerType].
  static BuiltSet<PrayerType> get values => _$values;

  /// Gets the corresponding [PrayerType] value for given [name].
  static PrayerType valueOf(String name) => _$valueOf(name);

  // ----------------------------- SERIALIZER -----------------------------

  /// [Serializer] for this object.
  static Serializer<PrayerType> get serializer => _$prayerTypeSerializer;
}

// ignore: avoid_classes_with_only_static_members
///
/// Implementation of prayer times calculation that can be used worldwide.
///
class _PrayerCalculator {
  // ----------------------------- CONSTANTS ------------------------------

  // NOTE: Do imsak time can be calculated using angle parameter?
  // static const double _kImsakDefaultTime = 5.0;
  static const double _kFajrDefaultTime = 5.0;
  static const double _kSunriseDefaultTime = 6.0;
  static const double _kDhuhrDefaultTime = 12.0;
  static const double _kAsrDefaultTime = 13.0;
  static const double _kSunsetDefaultTime = 18.0;
  static const double _kMaghribDefaultTime = 18.0;
  static const double _kIshaDefaultTime = 18.0;
  static const int _kMicrosecondsInAnHour = 3600000000;

  // ------------------------------- FIELDS -------------------------------

  static final Logger _log = Logger('PrayerCalculator');

  // ------------------------------- METHODS ------------------------------

  ///
  /// Generate prayer times for one day at given date.
  ///
  static Prayers getPrayerTimesForOneDay(
      DateTime when,
      PrayerCalculationSettings settings,
      Geocoordinate coordinate,
      double timeZone) {
    assert(when != null);
    assert(settings != null);
    assert(coordinate != null);
    assert(timeZone != null);

    // User may pass the date in non-UTC or UTC. It should be converted to UTC
    // DateTime object before converting to Julian Date or the libcalendar
    // will throw error. After all, this method only interested in the year,
    // month and day component of the passed date.
    final int year = when.year;
    final int month = when.month;
    final int day = when.day;
    final DateTime utc = DateTime.utc(year, month, day);
    _log.fine('Computing prayer times for one day for date: $utc.');

    final double jd = fromGregorianToJulianDate(utc);
    _log.fine('Calculated Julian Date for $utc is $jd.');

    final double newJd = jd - (coordinate.longitude / 360.0);
    _log.fine('Calculated Julian Date for $utc after adjustment is $newJd.');

    final _PrayersInDouble raw =
        _computeRaw(newJd, settings, coordinate.latitude, coordinate.altitude);
    final _PrayersInDouble afterAdjustment =
        _adjustTime(raw, settings, coordinate.longitude, timeZone);

    // Calculate midnight.
    final double fajr = afterAdjustment.fajr;
    final double sunrise = afterAdjustment.sunrise;
    final double sunset = afterAdjustment.sunset;
    afterAdjustment.midnight = _computeMidnightTime(
        settings.calculationMethod.midnight, fajr, sunrise, sunset);

    // Convert.
    final Prayers converted =
        _convertFromFloatingPointFormat(year, month, day, afterAdjustment);
    final Prayers rounded = Prayers((PrayersBuilder b) => b
      ..imsak = _roundPrayerTime(converted.imsak)
      ..fajr = _roundPrayerTime(converted.fajr)
      ..sunrise = _roundPrayerTime(converted.sunrise)
      ..dhuha = _roundPrayerTime(converted.dhuha)
      ..dhuhr = _roundPrayerTime(converted.dhuhr)
      ..asr = _roundPrayerTime(converted.asr)
      ..sunset = _roundPrayerTime(converted.sunset)
      ..maghrib = _roundPrayerTime(converted.maghrib)
      ..isha = _roundPrayerTime(converted.isha)
      ..midnight = _roundPrayerTime(converted.midnight));

    return rounded;
  }

  ///
  /// Generate current prayer time.
  ///
  static Prayer getCurrentPrayerTime(
      Clock clock,
      PrayerCalculationSettings settings,
      Geocoordinate coordinate,
      double timeZone) {
    final DateTime now = clock.now();
    final Prayers today =
        getPrayerTimesForOneDay(now, settings, coordinate, timeZone);
    final Prayers yesterday = getPrayerTimesForOneDay(
        now.add(const Duration(days: -1)), settings, coordinate, timeZone);

    if (now.isBefore(today.imsak)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.isha
        ..time = yesterday.isha);
    }

    if (now.isBefore(today.fajr)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.imsak
        ..time = today.imsak);
    }

    if (now.isBefore(today.sunrise)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.fajr
        ..time = today.fajr);
    }

    if (now.isBefore(today.dhuha)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.sunrise
        ..time = today.sunrise);
    }

    if (now.isBefore(today.dhuhr)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.dhuha
        ..time = today.dhuha);
    }

    if (now.isBefore(today.asr)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.dhuhr
        ..time = today.dhuhr);
    }

    if (now.isBefore(today.maghrib)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.asr
        ..time = today.asr);
    }

    if (now.isBefore(today.isha)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.maghrib
        ..time = today.maghrib);
    }

    return Prayer((PrayerBuilder b) => b
      ..type = PrayerType.isha
      ..time = today.isha);
  }

  ///
  /// Generate next prayer time.
  ///
  static Prayer getNextPrayerTime(
      Clock clock,
      PrayerCalculationSettings settings,
      Geocoordinate coordinate,
      double timeZone) {
    final DateTime now = clock.now();
    final Prayers today =
        getPrayerTimesForOneDay(now, settings, coordinate, timeZone);
    final Prayers tomorrow = getPrayerTimesForOneDay(
        now.add(const Duration(days: 1)), settings, coordinate, timeZone);

    if (now.isBefore(today.imsak)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.imsak
        ..time = today.imsak);
    }

    if (now.isBefore(today.fajr)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.fajr
        ..time = today.fajr);
    }

    if (now.isBefore(today.sunrise)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.sunrise
        ..time = today.sunrise);
    }

    if (now.isBefore(today.dhuha)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.dhuha
        ..time = today.dhuha);
    }

    if (now.isBefore(today.dhuhr)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.dhuhr
        ..time = today.dhuhr);
    }

    if (now.isBefore(today.asr)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.asr
        ..time = today.asr);
    }

    if (now.isBefore(today.maghrib)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.maghrib
        ..time = today.maghrib);
    }

    if (now.isBefore(today.isha)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.isha
        ..time = today.isha);
    }

    return Prayer((PrayerBuilder b) => b
      ..type = PrayerType.imsak
      ..time = tomorrow.imsak);
  }

  ///
  /// Generate later prayer time.
  ///
  static Prayer getLaterPrayerTime(
      Clock clock,
      PrayerCalculationSettings settings,
      Geocoordinate coordinate,
      double timeZone) {
    final DateTime now = clock.now();
    final Prayers today =
        getPrayerTimesForOneDay(now, settings, coordinate, timeZone);
    final Prayers tomorrow = getPrayerTimesForOneDay(
        now.add(const Duration(days: 1)), settings, coordinate, timeZone);

    if (now.isBefore(today.imsak)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.fajr
        ..time = today.fajr);
    }

    if (now.isBefore(today.fajr)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.sunrise
        ..time = today.sunrise);
    }

    if (now.isBefore(today.sunrise)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.dhuha
        ..time = today.dhuha);
    }

    if (now.isBefore(today.dhuha)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.dhuhr
        ..time = today.dhuhr);
    }

    if (now.isBefore(today.dhuhr)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.asr
        ..time = today.asr);
    }

    if (now.isBefore(today.asr)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.maghrib
        ..time = today.maghrib);
    }

    if (now.isBefore(today.maghrib)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.isha
        ..time = today.isha);
    }

    if (now.isBefore(today.isha)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.imsak
        ..time = tomorrow.imsak);
    }

    return Prayer((PrayerBuilder b) => b
      ..type = PrayerType.fajr
      ..time = tomorrow.fajr);
  }

  ///
  /// Generate after later prayer time.
  ///
  static Prayer getAfterLaterPrayerTime(
      Clock clock,
      PrayerCalculationSettings settings,
      Geocoordinate coordinate,
      double timeZone) {
    final DateTime now = clock.now();
    final Prayers today =
        getPrayerTimesForOneDay(now, settings, coordinate, timeZone);
    final Prayers tomorrow = getPrayerTimesForOneDay(
        now.add(const Duration(days: 1)), settings, coordinate, timeZone);

    if (now.isBefore(today.imsak)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.sunrise
        ..time = today.sunrise);
    }

    if (now.isBefore(today.fajr)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.dhuha
        ..time = today.dhuha);
    }

    if (now.isBefore(today.sunrise)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.dhuhr
        ..time = today.dhuhr);
    }

    if (now.isBefore(today.dhuha)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.asr
        ..time = today.asr);
    }

    if (now.isBefore(today.dhuhr)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.maghrib
        ..time = today.maghrib);
    }

    if (now.isBefore(today.asr)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.isha
        ..time = today.isha);
    }

    if (now.isBefore(today.maghrib)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.imsak
        ..time = tomorrow.imsak);
    }

    if (now.isBefore(today.isha)) {
      return Prayer((PrayerBuilder b) => b
        ..type = PrayerType.fajr
        ..time = tomorrow.fajr);
    }

    return Prayer((PrayerBuilder b) => b
      ..type = PrayerType.sunrise
      ..time = tomorrow.sunrise);
  }

  ///
  /// Compute all prayer times at given Julian Date and return the raw results.
  ///
  static _PrayersInDouble _computeRaw(double jd,
      PrayerCalculationSettings settings, double latitude, double altitude) {
    final _PrayersInDouble raw = _PrayersInDouble();

    try {
      // Compute imsak.
      if (settings.imsakParameter.type ==
          PrayerCalculationParameterType.angle) {
        // raw.imsak = _computeImsakTime(jd, settings.imsakParameter.value, latitude);
        // NOTE: Do imsak time can be calculated using angle parameter?
        throw _PrayerCalculatorError(
            'Imsak calculation parameter type must be the type of minute adjust.');
      }

      // Check fajr parameter type.
      if (settings.calculationMethod.fajrParameter.type ==
          PrayerCalculationParameterType.minutesAdjust) {
        throw _PrayerCalculatorError(
            'Fajr calculation parameter type must be the type of angle.');
      }
    } catch (e) {
      _log.warning(e.toString());
    }

    // Compute fajr, sunrise, dhuha, dhuhr, asr and sunset.
    raw
      ..fajr = _computeFajrTime(
          jd, settings.calculationMethod.fajrParameter.value, latitude)
      ..sunrise = _computeSunriseTime(jd, latitude, altitude)
      ..dhuha = _computeDhuhaTime(raw.fajr, raw.sunrise)
      ..dhuhr = _computeDhuhrTime(jd)
      ..asr =
          _computeAsrTime(jd, settings.juristicMethod.timeOfShadow, latitude)
      ..sunset = _computeSunsetTime(jd, latitude, altitude);

    // Compute maghrib.
    if (settings.calculationMethod.maghribParameter.type ==
        PrayerCalculationParameterType.angle) {
      raw.maghrib = _computeMaghribTime(
          jd, settings.calculationMethod.maghribParameter.value, latitude);
    }

    // Compute isha.
    if (settings.calculationMethod.ishaParameter.type ==
        PrayerCalculationParameterType.angle) {
      raw.isha = _computeIshaTime(
          jd, settings.calculationMethod.ishaParameter.value, latitude);
    }

    return raw;
  }

  ///
  /// Calculate prayer time for imsak.
  ///
  // NOTE: Do imsak time can be calculated using angle parameter?
  // static double _computeImsakTime(double jd, double imsakParameterValue, double latitude) {
  //   _log.fine('Computing imsak prayer time.');

  //   final double dayFraction = getDayFraction(PrayerCalculatorBase._kImsakDefaultTime);
  //   final double imsakTime = computeSolarTime(jd, dayFraction, imsakParameterValue, latitude, Direction.counterClockwise);
  //   _log.info('Calculated imsak: $imsakTime.');

  //   return imsakTime;
  // }

  ///
  /// Calculate prayer time for fajr.
  ///
  static double _computeFajrTime(
      double jd, double fajrParameterValue, double latitude) {
    _log.fine('Computing fajr prayer time.');

    final double dayFraction = getDayFraction(_kFajrDefaultTime);
    final double fajrTime = computeSolarTime(jd, dayFraction,
        fajrParameterValue, latitude, Direction.counterClockwise);
    _log.info('Calculated fajr: $fajrTime.');

    return fajrTime;
  }

  ///
  /// Calculate prayer time for sunrise.
  ///
  static double _computeSunriseTime(
      double jd, double latitude, double altitude) {
    _log.fine('Computing sunrise prayer time.');

    final double dayFraction = getDayFraction(_kSunriseDefaultTime);
    final double sunriseAngle = computeSunriseAngle(altitude);
    final double sunriseTime = computeSolarTime(
        jd, dayFraction, sunriseAngle, latitude, Direction.counterClockwise);
    _log.info('Calculated sunrise: $sunriseTime.');

    return sunriseTime;
  }

  ///
  /// Calculate prayer time for dhuha.
  ///
  static double _computeDhuhaTime(double fajr, double sunrise) {
    _log.fine('Computing dhuha prayer time.');

    final double dhuhaTime = sunrise + ((sunrise - fajr) / 3);
    _log.info('Calculated dhuha: $dhuhaTime.');

    return dhuhaTime;
  }

  ///
  /// Calculate prayer time for dhuhr.
  ///
  static double _computeDhuhrTime(double jd) {
    _log.fine('Computing dhuhr prayer time.');

    final double dayFraction = getDayFraction(_kDhuhrDefaultTime);
    final double midDay = computeMidDay(jd, dayFraction);

    // The fiqh method which states that dhuhr is when the sun's disk comes out
    // of its zenith line, which is a line between the observer and the center
    // of the sun when it is at the highest point is used here. Thus,
    // additional 65 seconds is added to the mid day time, which corresponds
    // to the formula t = arctan(r/d) / 2π × 24 × 60 × 60, where r is the
    // radius of the sun (r = 695,000km), d is the sun-earth distance
    // (d = 147,098,074km at minimum and d = 152,097,701km at maximum).
    // When, d is at maximum, t evaluates to ~62 seconds and ~65 seconds when
    // d is at minimum. Converting 65 seconds to hour yields a value of
    // 0.018055555555555554.
    final double dhuhrTime = midDay + 0.018055555555555554;
    _log.info('Calculated dhuhr: $dhuhrTime.');

    return dhuhrTime;
  }

  ///
  /// Calculate prayer time for asr.
  ///
  static double _computeAsrTime(
      double jd, int juristicTimeOfShadow, double latitude) {
    _log.fine('Computing asr prayer time.');

    final double dayFraction = getDayFraction(_kAsrDefaultTime);
    final double sunDeclination = computeSunDeclination(jd + dayFraction);
    final double angle = -inverseCotangentInDegree(juristicTimeOfShadow +
        tangentOfDegree((latitude - sunDeclination).abs()));
    final double asrTime =
        computeSolarTime(jd, dayFraction, angle, latitude, Direction.clockwise);
    _log.info('Calculated asr: $asrTime.');

    return asrTime;
  }

  ///
  /// Calculate prayer time for sunset.
  ///
  static double _computeSunsetTime(
      double jd, double latitude, double altitude) {
    _log.fine('Computing sunset prayer time.');

    final double dayFraction = getDayFraction(_kSunsetDefaultTime);
    final double sunriseAngle = computeSunriseAngle(altitude);
    final double sunsetTime = computeSolarTime(
        jd, dayFraction, sunriseAngle, latitude, Direction.clockwise);
    _log.info('Calculated sunset: $sunsetTime.');

    return sunsetTime;
  }

  ///
  /// Calculate prayer time for maghrib.
  ///
  static double _computeMaghribTime(
      double jd, double maghribParameterValue, double latitude) {
    _log.fine('Computing maghrib prayer time.');

    final double dayFraction = getDayFraction(_kMaghribDefaultTime);
    final double maghribTime = computeSolarTime(
        jd, dayFraction, maghribParameterValue, latitude, Direction.clockwise);
    _log.info('Calculated maghrib: $maghribTime.');

    return maghribTime;
  }

  ///
  /// Calculate prayer time for isha.
  ///
  static double _computeIshaTime(
      double jd, double ishaParameterValue, double latitude) {
    _log.fine('Computing isyak prayer time.');

    final double dayFraction = getDayFraction(_kIshaDefaultTime);
    final double ishaTime = computeSolarTime(
        jd, dayFraction, ishaParameterValue, latitude, Direction.clockwise);
    _log.info('Calculated isha: $ishaTime.');

    return ishaTime;
  }

  ///
  /// Calculate time for midnight.
  ///
  static double _computeMidnightTime(
      Midnight method, double fajr, double sunrise, double sunset) {
    _log.fine('Computing midnight time.');

    final double duration = method == Midnight.jafari
        ? computeDuration(fajr, sunset)
        : computeDuration(sunrise, sunset);
    final double midnightTime = sunset + (duration / 2.0);
    _log.info('Calculated midnight: $midnightTime.');

    return midnightTime;
  }

  ///
  /// Apply adjustments to given calculated prayer time.
  ///
  static _PrayersInDouble _adjustTime(_PrayersInDouble raw,
      PrayerCalculationSettings settings, double longitude, double timeZone) {
    // Copy reference.
    _PrayersInDouble newRaw = raw;

    // Adjust imsak if minute adjustment parameter is used.
    if (settings.imsakParameter.type ==
        PrayerCalculationParameterType.minutesAdjust) {
      newRaw.imsak = newRaw.fajr + (settings.imsakParameter.value / 60.0);
    }

    // Adjust maghrib if minute adjustment parameter is used.
    // This is Sunni method which maghrib equals to sunset. As precaution, this
    // library add 1 minute to the sunset time.
    if (settings.calculationMethod.maghribParameter.type ==
        PrayerCalculationParameterType.minutesAdjust) {
      newRaw.maghrib = newRaw.sunset +
          0.016666666666666667 +
          (settings.calculationMethod.maghribParameter.value / 60.0);
    }

    // Adjust isha if minute adjustment parameter is used.
    if (settings.calculationMethod.ishaParameter.type ==
        PrayerCalculationParameterType.minutesAdjust) {
      newRaw.isha = newRaw.maghrib +
          (settings.calculationMethod.ishaParameter.value / 60.0);
    }

    // Adjust to time zone.
    newRaw = _adjustAllToTimeZone(newRaw, longitude, timeZone);
    newRaw = _adjustAllForHighLatitude(newRaw, settings);
    newRaw = _minuteAdjustAll(newRaw, settings);
    return newRaw;
  }

  ///
  /// Apply time zone adjustment to given calculated prayer time.
  ///
  static _PrayersInDouble _adjustAllToTimeZone(
      _PrayersInDouble raw, double longitude, double timeZone) {
    final double adjustment = timeZone - (longitude / 15.0);
    raw
      ..imsak = raw.imsak + adjustment
      ..fajr = raw.fajr + adjustment
      ..sunrise = raw.sunrise + adjustment
      ..dhuha = raw.dhuha + adjustment
      ..dhuhr = raw.dhuhr + adjustment
      ..asr = raw.asr + adjustment
      ..sunset = raw.sunset + adjustment
      ..maghrib = raw.maghrib + adjustment
      ..isha = raw.isha + adjustment;

    return raw;
  }

  ///
  /// Adjust calculated imsak, fajr, maghrib and isha prayer times to high
  /// latitude adjustment.
  ///
  static _PrayersInDouble _adjustAllForHighLatitude(
      _PrayersInDouble raw, PrayerCalculationSettings settings) {
    //
    // Do not apply adjustment if none option is specified.
    if (settings.highLatitudeAdjustment == HighLatitudeAdjustment.none) {
      return raw;
    }

    // Copy reference.
    final HighLatitudeAdjustment method = settings.highLatitudeAdjustment;
    final double imsak = raw.imsak;
    final double fajr = raw.fajr;
    final double sunrise = raw.sunrise;
    final double sunset = raw.sunset;
    final double maghrib = raw.maghrib;
    final double isha = raw.isha;
    final double imsakParameterValue = settings.imsakParameter.value;
    final double fajrParameterValue =
        settings.calculationMethod.fajrParameter.value;
    final double maghribParameterValue =
        settings.calculationMethod.maghribParameter.value;
    final double ishaParameterValue =
        settings.calculationMethod.ishaParameter.value;

    // Compute sunrise to sunset difference.
    final double diff = computeDuration(raw.sunrise, raw.sunset);

    // Adjust.
    raw
      ..imsak = _adjustForHighLatitude(method, imsak, sunrise,
          imsakParameterValue, diff, Direction.counterClockwise)
      ..fajr = _adjustForHighLatitude(method, fajr, sunrise, fajrParameterValue,
          diff, Direction.counterClockwise)
      ..maghrib = _adjustForHighLatitude(method, maghrib, sunset,
          maghribParameterValue, diff, Direction.clockwise)
      ..isha = _adjustForHighLatitude(
          method, isha, sunset, ishaParameterValue, diff, Direction.clockwise);

    return raw;
  }

  ///
  /// Adjust calculated prayer time to high latitude adjustment.
  ///
  static double _adjustForHighLatitude(
      HighLatitudeAdjustment method,
      double time,
      double baseTime,
      double angle,
      double diff,
      Direction direction) {
    // Compute night fraction and duration.
    final double nightFraction = getNightFraction(method, angle, diff);
    final double duration = direction == Direction.clockwise
        ? computeDuration(time, baseTime)
        : computeDuration(baseTime, time);

    // Copy reference;
    double newTime = time;
    if (duration > nightFraction) {
      final double adjustment =
          direction == Direction.clockwise ? nightFraction : -nightFraction;
      newTime = baseTime + adjustment;
    }

    return newTime;
  }

  ///
  /// Apply time zone adjustment to given calculated prayer time.
  ///
  static _PrayersInDouble _minuteAdjustAll(
      _PrayersInDouble raw, PrayerCalculationSettings settings) {
    raw
      ..imsak = raw.imsak + (settings.imsakMinutesAdjustment / 60.0)
      ..fajr = raw.fajr + (settings.fajrMinutesAdjustment / 60.0)
      ..sunrise = raw.sunrise + (settings.sunriseMinutesAdjustment / 60.0)
      ..dhuha = raw.dhuha + (settings.dhuhaMinutesAdjustment / 60.0)
      ..dhuhr = raw.dhuhr + (settings.dhuhrMinutesAdjustment / 60.0)
      ..asr = raw.asr + (settings.asrMinutesAdjustment / 60.0)
      ..maghrib = raw.maghrib + (settings.maghribMinutesAdjustment / 60.0)
      ..isha = raw.isha + (settings.ishaMinutesAdjustment / 60.0);

    return raw;
  }

  ///
  /// Convert [_PrayersInDouble] to [Prayers].
  ///
  static Prayers _convertFromFloatingPointFormat(
      int year, int month, int day, _PrayersInDouble prayers) {
    final DateTime date = DateTime(year, month, day);
    return Prayers((PrayersBuilder b) => b
      ..imsak = date.add(Duration(
          microseconds: (prayers.imsak * _kMicrosecondsInAnHour).round()))
      ..fajr = date.add(Duration(
          microseconds: (prayers.fajr * _kMicrosecondsInAnHour).round()))
      ..sunrise = date.add(Duration(
          microseconds: (prayers.sunrise * _kMicrosecondsInAnHour).round()))
      ..dhuha = date.add(Duration(
          microseconds: (prayers.dhuha * _kMicrosecondsInAnHour).round()))
      ..dhuhr = date.add(Duration(
          microseconds: (prayers.dhuhr * _kMicrosecondsInAnHour).round()))
      ..asr = date.add(Duration(
          microseconds: (prayers.asr * _kMicrosecondsInAnHour).round()))
      ..sunset = date.add(Duration(
          microseconds: (prayers.sunset * _kMicrosecondsInAnHour).round()))
      ..maghrib = date.add(Duration(
          microseconds: (prayers.maghrib * _kMicrosecondsInAnHour).round()))
      ..isha = date.add(Duration(
          microseconds: (prayers.isha * _kMicrosecondsInAnHour).round()))
      ..midnight = date.add(Duration(
          microseconds: (prayers.midnight * _kMicrosecondsInAnHour).round())));
  }

  ///
  /// If given [DateTime] object of parameter [time] has second component
  /// larger than zero, the second component is resetted to zero and
  /// minute component is added with one.
  ///
  static DateTime _roundPrayerTime(DateTime time) {
    final DateTime withoutSecond =
        DateTime(time.year, time.month, time.day, time.hour, time.minute);
    if (time.second == 0) {
      return withoutSecond;
    }

    final int diff = time.difference(withoutSecond).inSeconds;
    final Duration toAdd = Duration(seconds: 60 - diff);

    final DateTime newTime = time.add(toAdd);
    return DateTime(
        newTime.year, newTime.month, newTime.day, newTime.hour, newTime.minute);
  }
}

///
/// Prayer times data for a single day in floating point format.
///
class _PrayersInDouble {
  // ------------------------------- FIELDS -------------------------------

  /// Imsak prayer time in floating point format.
  double imsak;

  /// Fajr prayer time in floating point format.
  double fajr;

  /// Sunrise time in floating point format.
  double sunrise;

  /// Dhuha prayer time in floating point format.
  double dhuha;

  /// Dhuhr prayer time in floating point format.
  double dhuhr;

  /// Asr prayer time in floating point format.
  double asr;

  /// Sunset time in floating point format.
  double sunset;

  /// Maghrib prayer time in floating point format.
  double maghrib;

  /// Isha prayer time in floating point format.
  double isha;

  /// Midnight time in floating point format.
  double midnight;
}

///
/// Contains error information thrown by prayer times calculator methods.
///
class _PrayerCalculatorError extends Error {
  // ------------------------------- FIELDS -------------------------------

  /// Brief message which tells why the error occured.
  final String reason;

  // ---------------------------- CONSTRUCTORS ----------------------------

  ///
  /// Create [_PrayerCalculatorError].
  ///
  _PrayerCalculatorError(this.reason);
}

///
/// Contains method for getting current date and time.
///
class Clock {
  // ---------------------------- CONSTRUCTORS ----------------------------

  ///
  /// Create [Clock].
  ///
  const Clock();

  // ------------------------------- METHODS ------------------------------

  ///
  /// Gets the current local date and time.
  ///
  DateTime now() {
    return DateTime.now();
  }

  ///
  /// Gets the current UTC date and time.
  ///
  DateTime utcNow() {
    return DateTime.now().toUtc();
  }
}
