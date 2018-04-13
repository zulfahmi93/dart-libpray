///
/// Represents the high latitude adjustment method used for calculating prayer
/// times at high latitude place/location.
///
enum HighLatitudeAdjustment {
  ///
  /// No adjustment applied.
  ///
  none,

  ///
  /// Use middle of the night adjustment method.
  ///
  middleOfNight,

  ///
  /// Use 1/7th of the night adjustment method.
  ///
  oneSeventhOfNight,

  ///
  /// Use angle-based adjustment method.
  ///
  angleBased
}
