import 'package:logging/logging.dart';

///
/// Provides properties for holding information used for calculating asar
/// prayer. Provides methods for getting and setting the prayer times juristic
/// method parameter.
///
class JuristicMethod {
  /* BEGIN FIELD SECTION */

  final Logger _log = new Logger('CalculationMethod');
  JuristicMethodPreset _preset;
  int _timeOfShadow;

  /* END FIELD SECTION */
  /* BEGIN CONSTRUCTOR SECTION */

  ///
  /// Create new [JuristicMethod].
  ///
  JuristicMethod() {
    setJuristicMethodPreset(JuristicMethodPreset.standard);
  }

  /* END CONSTRUCTOR SECTION */
  /* BEGIN PROPERTY SECTION */

  ///
  /// Gets the juristic method preset.
  ///
  JuristicMethodPreset get preset => _preset;

  ///
  /// Gets the juristic method time of shadow parameter.
  ///
  int get timeOfShadow => _timeOfShadow;

  /* END PROPERTY SECTION */
  /* BEGIN METHOD SECTION */

  ///
  /// Gets the [JuristicMethodPreset] enumeration value which agrees to
  /// juristic method parameters held by current instance of
  /// [JuristicMethodPreset] object.
  ///
  JuristicMethodPreset getJuristicMethodPreset() {
    _log.fine('Getting juristic method preset.');

    if (timeOfShadow == 2) {
      _log.fine('Hanafi juristic method preset returned.');
      _preset = JuristicMethodPreset.hanafi;
      return JuristicMethodPreset.hanafi;
    }

    _log.fine('Standard juristic method preset returned.');
    _preset = JuristicMethodPreset.standard;
    _timeOfShadow = 1;
    return JuristicMethodPreset.standard;
  }

  ///
  /// Sets the juristic method parameters from given method preset.
  ///
  void setJuristicMethodPreset(JuristicMethodPreset preset) {
    assert(preset != null);

    switch (preset) {
      case JuristicMethodPreset.standard:
        _log.fine('Setting juristic method to Standard.');
        _preset = JuristicMethodPreset.standard;
        _timeOfShadow = 1;
        return;

      case JuristicMethodPreset.hanafi:
        _log.fine('Setting juristic method to Hanafi.');
        _preset = JuristicMethodPreset.hanafi;
        _timeOfShadow = 2;
        return;

      default:
        throw new ArgumentError.value(
            preset, 'preset', 'Parameter [preset] contains an invalid value.');
    }
  }

  /* END METHOD SECTION */
}

///
/// Represents the prayer times juristic method preset.
///
enum JuristicMethodPreset {
  /// Standard juristic method.
  standard,

  /// Hanafi juristic method.
  hanafi
}
