import 'package:meta/meta.dart';

///
/// Represents the point of a location on this earth.
///
@immutable
class Geocoordinate {
  /* BEGIN FIELD SECTION */

  ///
  /// Gets the latitude of this coordinate.
  ///
  final double latitude;

  ///
  /// Gets the longitude of this coordinate.
  ///
  final double longitude;

  ///
  /// Gets the altitude of this coordinate.
  ///
  final double altitude;

  /* END FIELD SECTION */
  /* BEGIN CONSTRUCTOR SECTION */

  ///
  /// Create new [Geocoordinate].
  ///
  const Geocoordinate(this.latitude, this.longitude, this.altitude);

  /* END CONSTRUCTOR SECTION */
}
