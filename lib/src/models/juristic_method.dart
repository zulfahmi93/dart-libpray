import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'juristic_method.g.dart';

///
/// .
///
abstract class JuristicMethod implements Built<JuristicMethod, JuristicMethodBuilder> {
  // ---------------------------- CONSTRUCTORS ----------------------------

  ///
  /// Create [JuristicMethod].
  ///
  factory JuristicMethod([updates(JuristicMethodBuilder b)]) = _$JuristicMethod;

  ///
  /// Create [JuristicMethod].
  ///
  JuristicMethod._();

  ///
  /// Create [JuristicMethod].
  ///
  factory JuristicMethod.fromPreset({@required JuristicMethodPreset preset}) {
    return preset.getJuristicMethod();
  }

  // ----------------------------- SERIALIZER -----------------------------

  /// [Serializer] for this object.
  static Serializer<JuristicMethod> get serializer => _$juristicMethodSerializer;

  // ----------------------------- PROPERTIES -----------------------------

  /// Gets the juristic method preset.
  JuristicMethodPreset get preset;

  /// Gets the juristic method time of shadow parameter.
  int get timeOfShadow;
}

///
/// Provides properties for holding information used for calculating asr
/// prayer. Provides methods for getting and setting the prayer times juristic
/// method parameter.
///
class JuristicMethodPreset extends EnumClass {
  // --------------------------- ENUM CONSTANTS ---------------------------

  /// Standard juristic method.
  static const JuristicMethodPreset standard = _$standard;

  /// Hanafi juristic method.
  static const JuristicMethodPreset hanafi = _$hanafi;

  // ---------------------------- CONSTRUCTORS ----------------------------

  ///
  /// Create [JuristicMethodPreset].
  ///
  const JuristicMethodPreset._(String name) : super(name);

  // ----------------------------- PROPERTIES -----------------------------

  /// All valid values for [JuristicMethodPreset].
  static BuiltSet<JuristicMethodPreset> get values => _$values;

  /// Gets the corresponding [JuristicMethodPreset] value for given [name].
  static JuristicMethodPreset valueOf(String name) => _$valueOf(name);

  // ----------------------------- SERIALIZER -----------------------------

  /// [Serializer] for this object.
  static Serializer<JuristicMethodPreset> get serializer => _$juristicMethodPresetSerializer;

  // ------------------------------- METHODS ------------------------------

  ///
  /// Gets the [JuristicMethod] for this preset.
  ///
  JuristicMethod getJuristicMethod() {
    return JuristicMethod((JuristicMethodBuilder b) => b
      ..preset = this
      ..timeOfShadow = this == JuristicMethodPreset.hanafi ? 2 : 1);
  }
}
