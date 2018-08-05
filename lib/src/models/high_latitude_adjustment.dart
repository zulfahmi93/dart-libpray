import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'high_latitude_adjustment.g.dart';

///
/// Represents the high latitude adjustment method used for calculating prayer
/// times at high latitude place/location.
///
class HighLatitudeAdjustment extends EnumClass {
  // --------------------------- ENUM CONSTANTS ---------------------------

  /// No adjustment applied.
  static const HighLatitudeAdjustment none = _$none;

  /// Use middle of the night adjustment method.
  static const HighLatitudeAdjustment middleOfNight = _$middleOfNight;

  /// Use 1/7th of the night adjustment method.
  static const HighLatitudeAdjustment oneSeventhOfNight = _$oneSeventhOfNight;

  /// Use angle-based adjustment method.
  static const HighLatitudeAdjustment angleBased = _$angleBased;

  // ---------------------------- CONSTRUCTORS ----------------------------

  ///
  /// Create [HighLatitudeAdjustment].
  ///
  const HighLatitudeAdjustment._(String name) : super(name);

  // ----------------------------- PROPERTIES -----------------------------

  /// All valid values for [HighLatitudeAdjustment].
  static BuiltSet<HighLatitudeAdjustment> get values => _$values;

  /// Gets the corresponding [HighLatitudeAdjustment] value for given [name].
  static HighLatitudeAdjustment valueOf(String name) => _$valueOf(name);

  // ----------------------------- SERIALIZER -----------------------------

  /// [Serializer] for this object.
  static Serializer<HighLatitudeAdjustment> get serializer => _$highLatitudeAdjustmentSerializer;
}
