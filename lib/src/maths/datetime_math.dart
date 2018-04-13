///
/// Fix the double precision floating point hour representation to a value
/// between 0 to 24.
///
double fixHour(double hour) {
  final double newHour = hour - (24.0 * (hour / 24.0).floor());
  if (newHour >= 0.0) {
    return newHour;
  }

  return newHour + 24.0;
}

///
/// Compute the duration between the given start hour and end hour.
///
double computeDuration(double end, double start) {
  return fixHour(end - start);
}
