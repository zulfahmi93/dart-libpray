import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'location.g.dart';

///
/// Represents the point of a location on this earth.
///
abstract class Geocoordinate implements Built<Geocoordinate, GeocoordinateBuilder> {
  // ---------------------------- CONSTRUCTORS ----------------------------

  ///
  /// Create [Geocoordinate].
  ///
  factory Geocoordinate([updates(GeocoordinateBuilder b)]) = _$Geocoordinate;

  ///
  /// Create [Geocoordinate].
  ///
  Geocoordinate._();

  // ----------------------------- SERIALIZER -----------------------------

  /// [Serializer] for this object.
  static Serializer<Geocoordinate> get serializer => _$geocoordinateSerializer;

  // ----------------------------- PROPERTIES -----------------------------

  /// Gets the latitude of this coordinate.
  double get latitude;

  /// Gets the longitude of this coordinate.
  double get longitude;

  /// Gets the altitude of this coordinate.
  double get altitude;
}
