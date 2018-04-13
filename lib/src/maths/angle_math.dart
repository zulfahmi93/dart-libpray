import 'dart:math';

///
/// Fix given angle in degree to a value between 0 to 360 only.
///
double fixDegreesAngle(double angle) {
  final double newAngle = angle - (360.0 * (angle / 360.0).floor());
  if (newAngle >= 0.0) {
    return newAngle;
  }

  return newAngle + 360.0;
}

///
/// Convert given angle value in degree to radian.
///
double degreeToRadian(double degree) {
  return 0.017453292519943295 * degree;
}

///
/// Convert given angle value in radian to degree.
///
double radianToDegree(double radian) {
  return 57.29577951308232 * radian;
}

///
/// Compute the cosine value of given angle in degree.
///
double cosineOfDegree(double angle) {
  return cos(degreeToRadian(angle));
}

///
/// Compute the angle in degree from given cosine value.
///
double inverseCosineInDegree(double cosineValue) {
  return radianToDegree(acos(cosineValue));
}

///
/// Compute the sine value of given angle in degree.
///
double sineOfDegree(double angle) {
  return sin(degreeToRadian(angle));
}

///
/// Compute the angle in degree from given sine value.
///
double inverseSineInDegree(double sineValue) {
  return radianToDegree(asin(sineValue));
}

///
/// Compute the tangent value of given angle in degree.
///
double tangentOfDegree(double angle) {
  return tan(degreeToRadian(angle));
}

///
/// Compute the angle in degree from given triangle opposite and adjacent side
/// values.
///
double inverseTangent2InDegree(double y, double x) {
  return radianToDegree(atan2(y, x));
}

///
/// Compute the angle in degree from given cotangent value.
///
double inverseCotangentInDegree(double cotangentValue) {
  return radianToDegree(atan(1 / cotangentValue));
}
