import 'package:meta/meta.dart';
import 'package:libcalendar/libcalendar.dart';
import 'package:libpray/src/maths/constants.dart';
import 'package:logging/logging.dart';

///
/// Provides properties for holding information used for calculating subuh,
/// maghrib and isyak prayers. Provides methods for getting and setting the
/// prayer times calculation method parameter.
///
class CalculationMethod {
  /* BEGIN FIELD SECTION */

  final Logger _log = new Logger('CalculationMethod');
  CalculationMethodPreset _preset;
  PrayerCalculationParameter _fajrParameter;
  PrayerCalculationParameter _maghribParameter;
  PrayerCalculationParameter _ishaParameter;
  Midnight _midnight;

  /* END FIELD SECTION */
  /* BEGIN CONSTRUCTOR SECTION */

  ///
  /// Create new [CalculationMethod].
  ///
  CalculationMethod() {
    setCalculationMethodPreset(new DateTime.now().toUtc(), CalculationMethodPreset.ummAlQuraUniversity);
  }

  /* END CONSTRUCTOR SECTION */
  /* BEGIN PROPERTY SECTION */

  ///
  /// Gets the calculation method preset.
  ///
  CalculationMethodPreset get preset => _preset;

  ///
  /// Gets the calculation parameter for fajr prayer.
  ///
  PrayerCalculationParameter get fajrParameter => _fajrParameter;

  ///
  /// Gets the calculation parameter for maghrib prayer.
  ///
  PrayerCalculationParameter get maghribParameter => _maghribParameter;

  ///
  /// Gets the calculation parameter for isha prayer.
  ///
  PrayerCalculationParameter get ishaParameter => _ishaParameter;

  ///
  /// Gets the calculation parameter for midnight.
  ///
  Midnight get midnight => _midnight;

  /* END PROPERTY SECTION */
  /* BEGIN METHOD SECTION */

  ///
  /// Gets the [CalculationMethodPreset] enumeration value which agrees to
  /// calculation method parameters held by current instance of
  /// [CalculationMethod] object.
  ///
  CalculationMethodPreset getCalculationMethodPreset() {
    _log.fine('Getting calculation method preset.');

    //
    // JAKIM.
    if (preset == CalculationMethodPreset.departmentOfIslamicAdvancementOfMalaysia) {
      return CalculationMethodPreset.departmentOfIslamicAdvancementOfMalaysia;
    }

    //
    // Ithna Ashari
    if (((_fajrParameter.value - 16.0).abs() < Tolerance.course) &&
        (_fajrParameter._type == PrayerCalculationParameterType.angle) &&
        ((_maghribParameter.value - 4.0).abs() < Tolerance.course) &&
        (_maghribParameter._type == PrayerCalculationParameterType.angle) &&
        ((_ishaParameter.value - 14.0).abs() < Tolerance.course) &&
        (_ishaParameter._type == PrayerCalculationParameterType.angle) &&
        (_midnight == Midnight.jafari)) {
      _log.fine('Ithna Ashari calculation method preset returned.');
      _preset = CalculationMethodPreset.ithnaAshari;
      return CalculationMethodPreset.ithnaAshari;
    }

    //
    // University of Islamic Sciences, Karachi
    if (((_fajrParameter.value - 18.0).abs() < Tolerance.course) &&
        (_fajrParameter._type == PrayerCalculationParameterType.angle) &&
        ((_maghribParameter.value - 0.0).abs() < Tolerance.course) &&
        (_maghribParameter._type == PrayerCalculationParameterType.minutesAdjust) &&
        ((_ishaParameter.value - 18.0).abs() < Tolerance.course) &&
        (_ishaParameter._type == PrayerCalculationParameterType.angle) &&
        (_midnight == Midnight.standard)) {
      _log.fine('University of Islamic Sciences, Karachi calculation method preset returned.');
      _preset = CalculationMethodPreset.universityOfIslamicSciencesKarachi;
      return CalculationMethodPreset.universityOfIslamicSciencesKarachi;
    }

    //
    // Islamic Society of North America
    if (((_fajrParameter.value - 15.0).abs() < Tolerance.course) &&
        (_fajrParameter._type == PrayerCalculationParameterType.angle) &&
        ((_maghribParameter.value - 0.0).abs() < Tolerance.course) &&
        (_maghribParameter._type == PrayerCalculationParameterType.minutesAdjust) &&
        ((_ishaParameter.value - 15.0).abs() < Tolerance.course) &&
        (_ishaParameter._type == PrayerCalculationParameterType.angle) &&
        (_midnight == Midnight.standard)) {
      _log.fine('Islamic Society of North America calculation method preset returned.');
      _preset = CalculationMethodPreset.islamicSocietyOfNorthAmerica;
      return CalculationMethodPreset.islamicSocietyOfNorthAmerica;
    }

    //
    // Muslim World League
    if (((_fajrParameter.value - 18.0).abs() < Tolerance.course) &&
        (_fajrParameter._type == PrayerCalculationParameterType.angle) &&
        ((_maghribParameter.value - 0.0).abs() < Tolerance.course) &&
        (_maghribParameter._type == PrayerCalculationParameterType.minutesAdjust) &&
        ((_ishaParameter.value - 17.0).abs() < Tolerance.course) &&
        (_ishaParameter._type == PrayerCalculationParameterType.angle) &&
        (_midnight == Midnight.standard)) {
      _log.fine('Muslim World League calculation method preset returned.');
      _preset = CalculationMethodPreset.muslimWorldLeague;
      return CalculationMethodPreset.muslimWorldLeague;
    }

    //
    // Umm Al-Qura University, Makkah
    if ((((_fajrParameter.value - 19.0).abs() < Tolerance.course) || ((_fajrParameter.value - 18.5).abs() < Tolerance.course)) &&
        (_fajrParameter._type == PrayerCalculationParameterType.angle) &&
        ((_maghribParameter.value - 0.0).abs() < Tolerance.course) &&
        (_maghribParameter._type == PrayerCalculationParameterType.minutesAdjust) &&
        (((_ishaParameter.value - 90.0).abs() < Tolerance.course) || ((_ishaParameter.value - 120.0).abs() < Tolerance.course)) &&
        (_ishaParameter._type == PrayerCalculationParameterType.minutesAdjust) &&
        (_midnight == Midnight.standard)) {
      _log.fine('Umm Al-Qura University, Makkah calculation method preset returned.');
      _preset = CalculationMethodPreset.ummAlQuraUniversity;
      return CalculationMethodPreset.ummAlQuraUniversity;
    }

    //
    // Egyptian General Authority of Survey
    if (((_fajrParameter.value - 19.5).abs() < Tolerance.course) &&
        (_fajrParameter._type == PrayerCalculationParameterType.angle) &&
        ((_maghribParameter.value - 0.0).abs() < Tolerance.course) &&
        (_maghribParameter._type == PrayerCalculationParameterType.minutesAdjust) &&
        ((_ishaParameter.value - 17.5).abs() < Tolerance.course) &&
        (_ishaParameter._type == PrayerCalculationParameterType.angle) &&
        (_midnight == Midnight.standard)) {
      _log.fine('Egyptian General Authority of Survey calculation method preset returned.');
      _preset = CalculationMethodPreset.egyptianGeneralAuthorityOfSurvey;
      return CalculationMethodPreset.egyptianGeneralAuthorityOfSurvey;
    }

    //
    // Union des Organisations Islamiques de France
    if (((_fajrParameter.value - 12.0).abs() < Tolerance.course) &&
        (_fajrParameter._type == PrayerCalculationParameterType.angle) &&
        ((_maghribParameter.value - 0.0).abs() < Tolerance.course) &&
        (_maghribParameter._type == PrayerCalculationParameterType.minutesAdjust) &&
        ((_ishaParameter.value - 12.0).abs() < Tolerance.course) &&
        (_ishaParameter._type == PrayerCalculationParameterType.angle) &&
        (_midnight == Midnight.standard)) {
      _log.fine('Union des Organisations Islamiques de France calculation method preset returned.');
      _preset = CalculationMethodPreset.unionDesOrganisationsIslamiquesDeFrance;
      return CalculationMethodPreset.unionDesOrganisationsIslamiquesDeFrance;
    }

    //
    // Majlis Ugama Islam Singapura
    if (((_fajrParameter.value - 20.0).abs() < Tolerance.course) &&
        (_fajrParameter._type == PrayerCalculationParameterType.angle) &&
        ((_maghribParameter.value - 0.0).abs() < Tolerance.course) &&
        (_maghribParameter._type == PrayerCalculationParameterType.minutesAdjust) &&
        ((_ishaParameter.value - 18.0).abs() < Tolerance.course) &&
        (_ishaParameter._type == PrayerCalculationParameterType.angle) &&
        (_midnight == Midnight.standard)) {
      _log.fine('Majlis Ugama Islam Singapura calculation method preset returned.');
      _preset = CalculationMethodPreset.majlisUgamaIslamSingapura;
      return CalculationMethodPreset.majlisUgamaIslamSingapura;
    }

    //
    // Institute of Geophysics, University of Tehran
    if (((_fajrParameter.value - 17.7).abs() < Tolerance.course) &&
        (_fajrParameter._type == PrayerCalculationParameterType.angle) &&
        ((_maghribParameter.value - 4.5).abs() < Tolerance.course) &&
        (_maghribParameter._type == PrayerCalculationParameterType.angle) &&
        ((_ishaParameter.value - 14.0).abs() < Tolerance.course) &&
        (_ishaParameter._type == PrayerCalculationParameterType.angle) &&
        (_midnight == Midnight.jafari)) {
      _log.fine('Institute of Geophysics, University of Tehran calculation method preset returned.');
      _preset = CalculationMethodPreset.instituteOfGeophysicsUniversityOfTehran;
      return CalculationMethodPreset.instituteOfGeophysicsUniversityOfTehran;
    }

    //
    // Custom.
    _preset = CalculationMethodPreset.custom;
    return CalculationMethodPreset.custom;
  }

  ///
  /// Sets the calculation method parameters from given method preset.
  ///
  void setCalculationMethodPreset(DateTime dateInUtc, CalculationMethodPreset preset) {
    assert(dateInUtc != null);
    assert(preset != null);
    //
    // Umm Al-Qura University, Makkah
    if (preset == CalculationMethodPreset.ummAlQuraUniversity) {
      // Only check for date for Umm Al-Qura University, Makkah.
      if (!dateInUtc.isUtc) {
        throw new ArgumentError.value(dateInUtc, 'dateInUtc', 'Value of parameter [dateInUtc] should be in UTC.');
      }

      _log.fine('Configuring Ummul Qura calculation method.');

      // Convert Gregorian date to Hijri.
      final DateTime hijri = fromGregorianToIslamic(dateInUtc.year, dateInUtc.month, dateInUtc.day);
      final bool isBefore1430H = hijri.year < 1430;
      final bool isRamadhan = hijri.month == 9;

      _preset = CalculationMethodPreset.ummAlQuraUniversity;
      _fajrParameter = new PrayerCalculationParameter(isBefore1430H ? 19.0 : 18.5, PrayerCalculationParameterType.angle);
      _maghribParameter = const PrayerCalculationParameter(0.0, PrayerCalculationParameterType.minutesAdjust);
      _ishaParameter = new PrayerCalculationParameter(isRamadhan ? 120.0 : 90.0, PrayerCalculationParameterType.minutesAdjust);
      _midnight = Midnight.standard;
      return;
    }

    switch (preset) {
      case CalculationMethodPreset.ithnaAshari:
        _log.fine('Setting calculation method to Ithna Ashari.');
        _preset = CalculationMethodPreset.ithnaAshari;
        _fajrParameter = const PrayerCalculationParameter(16.0, PrayerCalculationParameterType.angle);
        _maghribParameter = const PrayerCalculationParameter(4.0, PrayerCalculationParameterType.angle);
        _ishaParameter = const PrayerCalculationParameter(14.0, PrayerCalculationParameterType.angle);
        _midnight = Midnight.jafari;
        return;

      case CalculationMethodPreset.universityOfIslamicSciencesKarachi:
        _log.fine('Setting calculation method to University of Islamic Sciences, Karachi.');
        _preset = CalculationMethodPreset.universityOfIslamicSciencesKarachi;
        _fajrParameter = const PrayerCalculationParameter(18.0, PrayerCalculationParameterType.angle);
        _maghribParameter = const PrayerCalculationParameter(0.0, PrayerCalculationParameterType.minutesAdjust);
        _ishaParameter = const PrayerCalculationParameter(18.0, PrayerCalculationParameterType.angle);
        _midnight = Midnight.standard;
        return;

      case CalculationMethodPreset.islamicSocietyOfNorthAmerica:
        _log.fine('Setting calculation method to Islamic Society of North America.');
        _preset = CalculationMethodPreset.islamicSocietyOfNorthAmerica;
        _fajrParameter = const PrayerCalculationParameter(15.0, PrayerCalculationParameterType.angle);
        _maghribParameter = const PrayerCalculationParameter(0.0, PrayerCalculationParameterType.minutesAdjust);
        _ishaParameter = const PrayerCalculationParameter(15.0, PrayerCalculationParameterType.angle);
        _midnight = Midnight.standard;
        return;

      case CalculationMethodPreset.muslimWorldLeague:
        _log.fine('Setting calculation method to Muslim World League.');
        _preset = CalculationMethodPreset.muslimWorldLeague;
        _fajrParameter = const PrayerCalculationParameter(18.0, PrayerCalculationParameterType.angle);
        _maghribParameter = const PrayerCalculationParameter(0.0, PrayerCalculationParameterType.minutesAdjust);
        _ishaParameter = const PrayerCalculationParameter(17.0, PrayerCalculationParameterType.angle);
        _midnight = Midnight.standard;
        return;

      case CalculationMethodPreset.egyptianGeneralAuthorityOfSurvey:
        _log.fine('Setting calculation method to Egyptian General Authority of Survey.');
        _preset = CalculationMethodPreset.egyptianGeneralAuthorityOfSurvey;
        _fajrParameter = const PrayerCalculationParameter(19.5, PrayerCalculationParameterType.angle);
        _maghribParameter = const PrayerCalculationParameter(0.0, PrayerCalculationParameterType.minutesAdjust);
        _ishaParameter = const PrayerCalculationParameter(17.5, PrayerCalculationParameterType.angle);
        _midnight = Midnight.standard;
        return;

      case CalculationMethodPreset.instituteOfGeophysicsUniversityOfTehran:
        _log.fine('Setting calculation method to Institute of Geophysics, University of Tehran.');
        _preset = CalculationMethodPreset.instituteOfGeophysicsUniversityOfTehran;
        _fajrParameter = const PrayerCalculationParameter(17.7, PrayerCalculationParameterType.angle);
        _maghribParameter = const PrayerCalculationParameter(4.5, PrayerCalculationParameterType.angle);
        _ishaParameter = const PrayerCalculationParameter(14.0, PrayerCalculationParameterType.angle);
        _midnight = Midnight.jafari;
        return;

      case CalculationMethodPreset.unionDesOrganisationsIslamiquesDeFrance:
        _log.fine('Setting calculation method to Union des Organisations Islamiques de France.');
        _preset = CalculationMethodPreset.unionDesOrganisationsIslamiquesDeFrance;
        _fajrParameter = const PrayerCalculationParameter(12.0, PrayerCalculationParameterType.angle);
        _maghribParameter = const PrayerCalculationParameter(0.0, PrayerCalculationParameterType.minutesAdjust);
        _ishaParameter = const PrayerCalculationParameter(12.0, PrayerCalculationParameterType.angle);
        _midnight = Midnight.standard;
        return;

      case CalculationMethodPreset.majlisUgamaIslamSingapura:
        _log.fine('Setting calculation method to Majlis Ugama Islam Singapura.');
        _preset = CalculationMethodPreset.majlisUgamaIslamSingapura;
        _fajrParameter = const PrayerCalculationParameter(20.0, PrayerCalculationParameterType.angle);
        _maghribParameter = const PrayerCalculationParameter(0.0, PrayerCalculationParameterType.minutesAdjust);
        _ishaParameter = const PrayerCalculationParameter(18.0, PrayerCalculationParameterType.angle);
        _midnight = Midnight.standard;
        return;

      case CalculationMethodPreset.departmentOfIslamicAdvancementOfMalaysia:
        _log.fine('Setting calculation method to Department of Islamic Advancement, Malaysia.');
        _preset = CalculationMethodPreset.departmentOfIslamicAdvancementOfMalaysia;
        _fajrParameter = const PrayerCalculationParameter(20.0, PrayerCalculationParameterType.angle);
        _maghribParameter = const PrayerCalculationParameter(0.0, PrayerCalculationParameterType.minutesAdjust);
        _ishaParameter = const PrayerCalculationParameter(18.0, PrayerCalculationParameterType.angle);
        _midnight = Midnight.standard;
        return;

      default:
        throw new ArgumentError.value(preset, 'preset', 'Parameter [preset] contains an invalid value.');
    }
  }

  ///
  /// Sets the calculation method parameters using custom parameters.
  ///
  void setCustomCalculationMethod(double fajrAngleParameter, double maghribParameter, PrayerCalculationParameterType maghribParameterType, double ishaParameter,
      PrayerCalculationParameterType ishaParameterType, Midnight midnight) {
    assert(fajrAngleParameter != null);
    assert(maghribParameter != null);
    assert(maghribParameterType != null);
    assert(ishaParameter != null);
    assert(ishaParameterType != null);
    assert(midnight != null);

    _log.fine('Configuring custom calculation method parameters.');

    _preset = CalculationMethodPreset.custom;
    _fajrParameter = new PrayerCalculationParameter(fajrAngleParameter, PrayerCalculationParameterType.angle);
    _maghribParameter = new PrayerCalculationParameter(maghribParameter, maghribParameterType);
    _ishaParameter = new PrayerCalculationParameter(ishaParameter, ishaParameterType);
    _midnight = midnight;
  }

/* END METHOD SECTION */
}

///
/// Represents the type of prayer times calculation parameter.
///
enum PrayerCalculationParameterType {
  /// Represents parameter which uses minute adjustment.
  minutesAdjust,

  /// Represents parameter which calculate prayer time using angle value.
  angle
}

///
/// Holds the calculation parameter used for prayer times calculation.
///
@immutable
class PrayerCalculationParameter {
  /* BEGIN FIELD SECTION */

  /// Type of the prayer times calculation parameter.
  final PrayerCalculationParameterType _type;

  /// Value of the prayer times calculation parameter.
  final double _value;

  /* END FIELD SECTION */
  /* BEGIN CONSTRUCTOR SECTION */

  ///
  /// Create new [PrayerCalculationParameter].
  ///
  const PrayerCalculationParameter(this._value, this._type);

  /* END CONSTRUCTOR SECTION */
  /* BEGIN PROPERTY SECTION */

  ///
  /// Gets the value of the prayer times calculation parameter.
  ///
  PrayerCalculationParameterType get type => _type;

  ///
  /// Gets the type of the prayer times calculation parameter.
  ///
  double get value => _value;

/* END PROPERTY SECTION */
}

///
/// Calculation method preset.
///
enum CalculationMethodPreset {
  /// Custom calculation method.
  custom,

  /// Ithna Ashari calculation method.
  ithnaAshari,

  /// University of Islamic Sciences, Karachi calculation method.
  universityOfIslamicSciencesKarachi,

  /// Islamic Society of North America calculation method.
  islamicSocietyOfNorthAmerica,

  /// Muslim World League calculation method.
  muslimWorldLeague,

  /// Umm Al-Qura University calculation method.
  ummAlQuraUniversity,

  /// Egyptian General Authority of Survey calculation method.
  egyptianGeneralAuthorityOfSurvey,

  /// Institute of Geophysics, University of Tehran calculation method.
  instituteOfGeophysicsUniversityOfTehran,

  /// Union Des Organisations Islamiques De France calculation method.
  unionDesOrganisationsIslamiquesDeFrance,

  /// Majlis Ugama Islam Singapura calculation method.
  majlisUgamaIslamSingapura,

  /// Department of Islamic Advancement of Malaysia calculation method.
  departmentOfIslamicAdvancementOfMalaysia
}

///
/// Represents the prayer times midnight method.
///
enum Midnight {
  /// Standard method.
  standard,

  /// Jafari method.
  jafari,
}
