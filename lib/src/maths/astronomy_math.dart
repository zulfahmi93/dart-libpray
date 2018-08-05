import 'dart:math' as math;

import '../models/high_latitude_adjustment.dart';
import 'angle_math.dart';
import 'datetime_math.dart';

///
/// Determine how to calculate the solar times.
///
enum Direction {
  ///
  /// Clockwise direction.
  ///
  clockwise,

  ///
  /// Counter-clockwise direction.
  ///
  counterClockwise
}

///
/// Compute day fraction value for given hour.
///
double getDayFraction(double hours) {
  return hours / 24.0;
}

///
/// Compute night fraction value for given high latitude method, angle and
/// sunset/sunrise difference.
///
double getNightFraction(HighLatitudeAdjustment method, double angle, double diff) {
  // Default value to middle of the night method.
  double nightFraction;

  switch (method) {
    case HighLatitudeAdjustment.middleOfNight:
      nightFraction = 0.5;
      break;

    case HighLatitudeAdjustment.oneSeventhOfNight:
      nightFraction = 0.14285714285714285;
      break;

    case HighLatitudeAdjustment.angleBased:
      nightFraction = 0.016666666666666667 * angle;
      break;

    default:
      throw ArgumentError.value(method, 'method', 'Parameter [method] cannot has value of none.');
  }

  return nightFraction * diff;
}

///
/// Compute solar time for given julian date, time fraction, angle, latitude
/// and direction.
///
double computeSolarTime(double julianDate, double timeFraction, double angle, double latitude, Direction direction) {
  final double sunDeclination = computeSunDeclination(julianDate + timeFraction);
  final double midDay = computeMidDay(julianDate, timeFraction);

  final double solarTime = 0.0666666666666667 *
      inverseCosineInDegree(
          (-sineOfDegree(angle) - (sineOfDegree(sunDeclination) * sineOfDegree(latitude))) / (cosineOfDegree(sunDeclination) * cosineOfDegree(latitude)));

  return midDay + (direction == Direction.counterClockwise ? -solarTime : solarTime);
}

///
/// Compute sun declination for given julian date.
///
double computeSunDeclination(double julianDate) {
  final double epochDaysFraction = _computeEpochDaysFraction(julianDate);
  final double sunMeanAnomaly = _computeSunMeanAnomaly(epochDaysFraction);
  final double sunMeanLongitude = _computeSunMeanLongitude(epochDaysFraction);
  final double sunEclipticLongitude = _computeSunEclipticLongitude(sunMeanLongitude, sunMeanAnomaly);
  final double eclipticMeanObliquity = _computeEclipticMeanObliquity(epochDaysFraction);

  return inverseSineInDegree(sineOfDegree(eclipticMeanObliquity) * sineOfDegree(sunEclipticLongitude));
}

///
/// Compute mid day hours for given julian date and time fraction.
///
double computeMidDay(double julianDate, double timeFraction) {
  final double equationOfTime = _computeEquationOfTime(julianDate + timeFraction);
  return fixHour(12.0 - equationOfTime);
}

///
/// Compute sunrise angle for given elevation in metres.
///
double computeSunriseAngle(double altitude) {
  return 0.833 + (0.0347 * math.sqrt(altitude));
}

///
/// Compute days and fraction from J2000 epoch for given julian date.
///
double _computeEpochDaysFraction(double when) {
  return when - 2451545.0;
}

///
/// Compute sun's mean anomaly for given J2000 epoch days and fraction.
///
double _computeSunMeanAnomaly(double epochDaysFraction) {
  return fixDegreesAngle(357.529 + (0.98560028 * epochDaysFraction));
}

///
/// Compute sun's mean longitude for given J2000 epoch days and fraction.
///
double _computeSunMeanLongitude(double epochDaysFraction) {
  return fixDegreesAngle(280.459 + (0.98564736 * epochDaysFraction));
}

///
/// Compute sun's ecliptic longitude for given mean longitude and mean anomaly.
///
double _computeSunEclipticLongitude(double sunMeanLongitude, double sunMeanAnomaly) {
  return fixDegreesAngle(sunMeanLongitude + (1.915 * sineOfDegree(sunMeanAnomaly)) + (0.02 * sineOfDegree(2.0 * sunMeanAnomaly)));
}

///
/// Compute the sun's ecliptic mean obliquity for given J2000 epoch days and
/// fraction.
///
double _computeEclipticMeanObliquity(double epochDaysFraction) {
  return 23.439 - (3.6E-07 * epochDaysFraction);
}

///
/// Compute equation of time for given julian date.
///
double _computeEquationOfTime(double julianDate) {
  final double epochDaysFraction = _computeEpochDaysFraction(julianDate);
  final double sunMeanAnomaly = _computeSunMeanAnomaly(epochDaysFraction);
  final double sunMeanLongitude = _computeSunMeanLongitude(epochDaysFraction);
  final double sunEclipticLongitude = _computeSunEclipticLongitude(sunMeanLongitude, sunMeanAnomaly);
  final double eclipticMeanObliquity = _computeEclipticMeanObliquity(epochDaysFraction);
  final double sunRightAscension = _computeSunRightAscension(eclipticMeanObliquity, sunEclipticLongitude);
  return (sunMeanLongitude / 15.0) - fixHour(sunRightAscension);
}

///
/// Compute sun's right ascension for given mean obliquity and ecliptic longitude.
///
double _computeSunRightAscension(double eclipticMeanObliquity, double sunEclipticLongitude) {
  return inverseTangent2InDegree(cosineOfDegree(eclipticMeanObliquity) * sineOfDegree(sunEclipticLongitude), cosineOfDegree(sunEclipticLongitude)) / 15.0;
}
