import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:libcalendar/libcalendar.dart';
import 'package:meta/meta.dart';

part 'calculation_method.g.dart';

///
/// Provides properties for holding information used for calculating subuh,
/// maghrib and isyak prayers. Provides methods for getting and setting the
/// prayer times calculation method parameter.
///
abstract class CalculationMethod implements Built<CalculationMethod, CalculationMethodBuilder> {
  // ---------------------------- CONSTRUCTORS ----------------------------

  ///
  /// Create [CalculationMethod].
  ///
  factory CalculationMethod([updates(CalculationMethodBuilder b)]) = _$CalculationMethod;

  ///
  /// Create [CalculationMethod].
  ///
  factory CalculationMethod.fromPreset({@required CalculationMethodPreset preset, DateTime when}) {
    return preset.getCalculationMethod(when);
  }

  ///
  /// Create [CalculationMethod].
  ///
  factory CalculationMethod.custom(
      {@required double fajrAngleParameter,
      @required double maghribParameter,
      @required PrayerCalculationParameterType maghribParameterType,
      @required double ishaParameter,
      @required PrayerCalculationParameterType ishaParameterType,
      @required Midnight midnight}) {
    return CalculationMethod((CalculationMethodBuilder b) => b
      ..preset = CalculationMethodPreset.custom
      ..fajrParameter.type = PrayerCalculationParameterType.angle
      ..fajrParameter.value = fajrAngleParameter
      ..maghribParameter.type = maghribParameterType
      ..maghribParameter.value = maghribParameter
      ..ishaParameter.type = ishaParameterType
      ..ishaParameter.value = ishaParameter
      ..midnight = midnight);
  }

  ///
  /// Create [CalculationMethod].
  ///
  CalculationMethod._();

  // ----------------------------- SERIALIZER -----------------------------

  /// [Serializer] for this object.
  static Serializer<CalculationMethod> get serializer => _$calculationMethodSerializer;

  // ----------------------------- PROPERTIES -----------------------------

  /// Calculation method preset.
  CalculationMethodPreset get preset;

  /// Calculation parameter for fajr prayer.
  PrayerCalculationParameter get fajrParameter;

  /// Calculation parameter for maghrib prayer.
  PrayerCalculationParameter get maghribParameter;

  /// Calculation parameter for isha prayer.
  PrayerCalculationParameter get ishaParameter;

  /// Calculation method for midnight.
  Midnight get midnight;
}

///
/// Represents the type of prayer times calculation parameter.
///
class PrayerCalculationParameterType extends EnumClass {
  // --------------------------- ENUM CONSTANTS ---------------------------

  /// Represents parameter which uses minute adjustment.
  static const PrayerCalculationParameterType minutesAdjust = _$minutesAdjust;

  /// Represents parameter which calculate prayer time using angle value.
  static const PrayerCalculationParameterType angle = _$angle;

  // ---------------------------- CONSTRUCTORS ----------------------------

  ///
  /// Create [PrayerCalculationParameterType].
  ///
  const PrayerCalculationParameterType._(String name) : super(name);

  // ----------------------------- PROPERTIES -----------------------------

  /// All valid values for [PrayerCalculationParameterType].
  static BuiltSet<PrayerCalculationParameterType> get values => _$valuesPCPT;

  /// Gets the corresponding [PrayerCalculationParameterType] value for given [name].
  static PrayerCalculationParameterType valueOf(String name) => _$valueOfPCPT(name);

  // ----------------------------- SERIALIZER -----------------------------

  /// [Serializer] for this object.
  static Serializer<PrayerCalculationParameterType> get serializer => _$prayerCalculationParameterTypeSerializer;
}

///
/// Holds the calculation parameter used for prayer times calculation.
///
abstract class PrayerCalculationParameter implements Built<PrayerCalculationParameter, PrayerCalculationParameterBuilder> {
  // ---------------------------- CONSTRUCTORS ----------------------------

  ///
  /// Create [PrayerCalculationParameter].
  ///
  factory PrayerCalculationParameter([updates(PrayerCalculationParameterBuilder b)]) = _$PrayerCalculationParameter;

  ///
  /// Create [PrayerCalculationParameter].
  ///
  PrayerCalculationParameter._();

  // ----------------------------- SERIALIZER -----------------------------

  /// [Serializer] for this object.
  static Serializer<PrayerCalculationParameter> get serializer => _$prayerCalculationParameterSerializer;

  // ----------------------------- PROPERTIES -----------------------------

  /// Type of the prayer times calculation parameter.
  @nullable
  PrayerCalculationParameterType get type;

  /// Value of the prayer times calculation parameter.
  @nullable
  double get value;
}

///
/// Calculation method preset.
///
class CalculationMethodPreset extends EnumClass {
  // --------------------------- ENUM CONSTANTS ---------------------------

  /// Custom calculation method.
  static const CalculationMethodPreset custom = _$custom;

  /// Ithna Ashari calculation method.
  static const CalculationMethodPreset ithnaAshari = _$ithnaAshari;

  /// University of Islamic Sciences, Karachi calculation method.
  static const CalculationMethodPreset universityOfIslamicSciencesKarachi = _$universityOfIslamicSciencesKarachi;

  /// Islamic Society of North America calculation method.
  static const CalculationMethodPreset islamicSocietyOfNorthAmerica = _$islamicSocietyOfNorthAmerica;

  /// Muslim World League calculation method.
  static const CalculationMethodPreset muslimWorldLeague = _$muslimWorldLeague;

  /// Umm Al-Qura University calculation method.
  static const CalculationMethodPreset ummAlQuraUniversity = _$ummAlQuraUniversity;

  /// Egyptian General Authority of Survey calculation method.
  static const CalculationMethodPreset egyptianGeneralAuthorityOfSurvey = _$egyptianGeneralAuthorityOfSurvey;

  /// Institute of Geophysics, University of Tehran calculation method.
  static const CalculationMethodPreset instituteOfGeophysicsUniversityOfTehran = _$instituteOfGeophysicsUniversityOfTehran;

  /// Union Des Organisations Islamiques De France calculation method.
  static const CalculationMethodPreset unionDesOrganisationsIslamiquesDeFrance = _$unionDesOrganisationsIslamiquesDeFrance;

  /// Majlis Ugama Islam Singapura calculation method.
  static const CalculationMethodPreset majlisUgamaIslamSingapura = _$majlisUgamaIslamSingapura;

  /// Department of Islamic Advancement of Malaysia calculation method.
  static const CalculationMethodPreset departmentOfIslamicAdvancementOfMalaysia = _$departmentOfIslamicAdvancementOfMalaysia;

  // ---------------------------- CONSTRUCTORS ----------------------------

  ///
  /// Create [CalculationMethodPreset].
  ///
  const CalculationMethodPreset._(String name) : super(name);

  // ----------------------------- PROPERTIES -----------------------------

  /// All valid values for [CalculationMethodPreset].
  static BuiltSet<CalculationMethodPreset> get values => _$values;

  /// Gets the corresponding [CalculationMethodPreset] value for given [name].
  static CalculationMethodPreset valueOf(String name) => _$valueOf(name);

  // ----------------------------- SERIALIZER -----------------------------

  /// [Serializer] for this object.
  static Serializer<CalculationMethodPreset> get serializer => _$calculationMethodPresetSerializer;

  // ------------------------------- METHODS ------------------------------

  ///
  /// Gets the [CalculationMethod] for this preset.
  ///
  CalculationMethod getCalculationMethod(DateTime when) {
    // Check if this a custom preset.
    if (this == CalculationMethodPreset.custom) {
      throw UnsupportedError('Custom calculation method preset is not supported.');
    }

    // Check for preset and date.
    if (this == CalculationMethodPreset.ummAlQuraUniversity || this == CalculationMethodPreset.departmentOfIslamicAdvancementOfMalaysia) {
      if (when == null) {
        throw ArgumentError.notNull('when');
      }

      if (!when.isUtc) {
        throw ArgumentError.value(when, 'when', 'Value of parameter [when] should be in UTC.');
      }
    }

    // Convert Gregorian date to Hijri.
    final DateTime hijri = this == CalculationMethodPreset.ummAlQuraUniversity ? fromGregorianToIslamic(when.year, when.month, when.day) : null;
    final DateTime gregorian = this == CalculationMethodPreset.departmentOfIslamicAdvancementOfMalaysia ? when : null;

    return CalculationMethod((CalculationMethodBuilder b) => b
      ..preset = this
      ..fajrParameter.replace(_getFajrAngleParameter(hijri, gregorian))
      ..maghribParameter.replace(_getMaghribParameter())
      ..ishaParameter.replace(_getIshaParameter(hijri))
      ..midnight = _getMidnight());
  }

  ///
  /// Gets the fajr angle parameter on given [hijri] and [gregorian] date for this preset.
  ///
  PrayerCalculationParameter _getFajrAngleParameter(DateTime hijri, DateTime gregorian) {
    const PrayerCalculationParameterType type = PrayerCalculationParameterType.angle;
    double value;

    switch (this) {
      case CalculationMethodPreset.ithnaAshari:
        value = 16.0;
        break;

      case CalculationMethodPreset.universityOfIslamicSciencesKarachi:
      case CalculationMethodPreset.muslimWorldLeague:
        value = 18.0;
        break;

      case CalculationMethodPreset.islamicSocietyOfNorthAmerica:
        value = 15.0;
        break;

      case CalculationMethodPreset.ummAlQuraUniversity:
        value = (hijri.year < 1430) ? 19.0 : 18.5;
        break;

      case CalculationMethodPreset.egyptianGeneralAuthorityOfSurvey:
        value = 19.5;
        break;

      case CalculationMethodPreset.instituteOfGeophysicsUniversityOfTehran:
        value = 17.7;
        break;

      case CalculationMethodPreset.unionDesOrganisationsIslamiquesDeFrance:
        value = 12.0;
        break;

      case CalculationMethodPreset.majlisUgamaIslamSingapura:
        value = 20.0;
        break;

      case CalculationMethodPreset.departmentOfIslamicAdvancementOfMalaysia:
        value = (gregorian.year < 2020) ? 20.0 : 18.0;
        break;
    }

    return PrayerCalculationParameter((PrayerCalculationParameterBuilder b) => b
      ..type = type
      ..value = value);
  }

  ///
  /// Gets the maghrib parameter for this preset.
  ///
  PrayerCalculationParameter _getMaghribParameter() {
    PrayerCalculationParameterType type;
    double value;

    switch (this) {
      case CalculationMethodPreset.ithnaAshari:
        type = PrayerCalculationParameterType.angle;
        value = 4.0;
        break;

      case CalculationMethodPreset.universityOfIslamicSciencesKarachi:
      case CalculationMethodPreset.islamicSocietyOfNorthAmerica:
      case CalculationMethodPreset.muslimWorldLeague:
      case CalculationMethodPreset.ummAlQuraUniversity:
      case CalculationMethodPreset.egyptianGeneralAuthorityOfSurvey:
      case CalculationMethodPreset.unionDesOrganisationsIslamiquesDeFrance:
      case CalculationMethodPreset.majlisUgamaIslamSingapura:
      case CalculationMethodPreset.departmentOfIslamicAdvancementOfMalaysia:
        type = PrayerCalculationParameterType.minutesAdjust;
        value = 0.0;
        break;

      case CalculationMethodPreset.instituteOfGeophysicsUniversityOfTehran:
        type = PrayerCalculationParameterType.angle;
        value = 4.5;
        break;
    }

    return PrayerCalculationParameter((PrayerCalculationParameterBuilder b) => b
      ..type = type
      ..value = value);
  }

  ///
  /// Gets the isha parameter on given [hijri] date for this preset.
  ///
  PrayerCalculationParameter _getIshaParameter(DateTime hijri) {
    PrayerCalculationParameterType type;
    double value;

    switch (this) {
      case CalculationMethodPreset.ithnaAshari:
      case CalculationMethodPreset.instituteOfGeophysicsUniversityOfTehran:
        type = PrayerCalculationParameterType.angle;
        value = 14.0;
        break;

      case CalculationMethodPreset.universityOfIslamicSciencesKarachi:
      case CalculationMethodPreset.majlisUgamaIslamSingapura:
      case CalculationMethodPreset.departmentOfIslamicAdvancementOfMalaysia:
        type = PrayerCalculationParameterType.angle;
        value = 18.0;
        break;

      case CalculationMethodPreset.islamicSocietyOfNorthAmerica:
        type = PrayerCalculationParameterType.angle;
        value = 15.0;
        break;

      case CalculationMethodPreset.muslimWorldLeague:
        type = PrayerCalculationParameterType.angle;
        value = 17.0;
        break;

      case CalculationMethodPreset.ummAlQuraUniversity:
        type = PrayerCalculationParameterType.minutesAdjust;
        value = (hijri.month == 9) ? 120.0 : 90.0;
        break;

      case CalculationMethodPreset.egyptianGeneralAuthorityOfSurvey:
        type = PrayerCalculationParameterType.angle;
        value = 17.5;
        break;

      case CalculationMethodPreset.unionDesOrganisationsIslamiquesDeFrance:
        type = PrayerCalculationParameterType.angle;
        value = 12.0;
        break;
    }

    return PrayerCalculationParameter((PrayerCalculationParameterBuilder b) => b
      ..type = type
      ..value = value);
  }

  ///
  /// Gets the midnight method for this preset.
  ///
  Midnight _getMidnight() {
    return ((this == CalculationMethodPreset.ithnaAshari) || (this == CalculationMethodPreset.instituteOfGeophysicsUniversityOfTehran))
        ? Midnight.jafari
        : Midnight.standard;
  }
}

///
/// Represents the prayer times midnight method.
///
class Midnight extends EnumClass {
  // --------------------------- ENUM CONSTANTS ---------------------------

  /// Standard method.
  static const Midnight standard = _$standard;

  /// Jafari method.
  static const Midnight jafari = _$jafari;

  // ---------------------------- CONSTRUCTORS ----------------------------

  ///
  /// Create [Midnight].
  ///
  const Midnight._(String name) : super(name);

  // ----------------------------- PROPERTIES -----------------------------

  /// All valid values for [Midnight].
  static BuiltSet<Midnight> get values => _$valuesM;

  /// Gets the corresponding [Midnight] value for given [name].
  static Midnight valueOf(String name) => _$valueOfM(name);

  // ----------------------------- SERIALIZER -----------------------------

  /// [Serializer] for this object.
  static Serializer<Midnight> get serializer => _$midnightSerializer;
}
