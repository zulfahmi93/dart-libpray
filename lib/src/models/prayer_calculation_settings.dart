import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'calculation_method.dart';
import 'high_latitude_adjustment.dart';
import 'juristic_method.dart';

part 'prayer_calculation_settings.g.dart';

///
/// Provides properties for holding information used for calculating prayer
/// times. Provides method for searching prayer times calculation settings from
/// given location information.
///
abstract class PrayerCalculationSettings
    implements
        Built<PrayerCalculationSettings, PrayerCalculationSettingsBuilder> {
  // ---------------------------- CONSTRUCTORS ----------------------------

  ///
  /// Create [PrayerCalculationSettings].
  ///
  factory PrayerCalculationSettings(
          [updates(PrayerCalculationSettingsBuilder b)]) =
      _$PrayerCalculationSettings;

  ///
  /// Create [PrayerCalculationSettings].
  ///
  PrayerCalculationSettings._();

  ///
  /// Create [PrayerCalculationSettings].
  ///
  factory PrayerCalculationSettings.defaultSettings() {
    return PrayerCalculationSettings((PrayerCalculationSettingsBuilder b) => b
      ..imsakParameter.value = -10.0
      ..imsakParameter.type = PrayerCalculationParameterType.minutesAdjust
      ..calculationMethod.replace(CalculationMethod.fromPreset(
          preset: CalculationMethodPreset.ummAlQuraUniversity,
          when: DateTime.now().toUtc()))
      ..juristicMethod.replace(
          JuristicMethod.fromPreset(preset: JuristicMethodPreset.standard))
      ..highLatitudeAdjustment = HighLatitudeAdjustment.none
      ..imsakMinutesAdjustment = 0
      ..fajrMinutesAdjustment = 0
      ..sunriseMinutesAdjustment = 0
      ..dhuhaMinutesAdjustment = 0
      ..dhuhrMinutesAdjustment = 0
      ..asrMinutesAdjustment = 0
      ..maghribMinutesAdjustment = 0
      ..ishaMinutesAdjustment = 0);
  }

  // ----------------------------- SERIALIZER -----------------------------

  /// [Serializer] for this object.
  static Serializer<PrayerCalculationSettings> get serializer =>
      _$prayerCalculationSettingsSerializer;

  // ----------------------------- PROPERTIES -----------------------------

  /// Calculation parameter for imsak prayer.
  @nullable
  PrayerCalculationParameter get imsakParameter;

  /// Calculation method for calculating fajr, maghrib and isha prayer.
  CalculationMethod get calculationMethod;

  /// Juristic method for calculating asr prayer.
  @nullable
  JuristicMethod get juristicMethod;

  /// High latitude adjustment method for adjusting imsak, fajr, maghrib and
  /// isha prayer times at a high latitude location.
  @nullable
  HighLatitudeAdjustment get highLatitudeAdjustment;

  /// Minute adjustment parameter for imsak prayer.
  @nullable
  int get imsakMinutesAdjustment;

  /// Minute adjustment parameter for fajr prayer.
  @nullable
  int get fajrMinutesAdjustment;

  /// Minute adjustment parameter for sunrise.
  @nullable
  int get sunriseMinutesAdjustment;

  /// Minute adjustment parameter for dhuha prayer.
  @nullable
  int get dhuhaMinutesAdjustment;

  /// Minute adjustment parameter for dhuhr prayer.
  @nullable
  int get dhuhrMinutesAdjustment;

  /// Minute adjustment parameter for asr prayer.
  @nullable
  int get asrMinutesAdjustment;

  /// Minute adjustment parameter for maghrib prayer.
  @nullable
  int get maghribMinutesAdjustment;

  /// Minute adjustment parameter for isha prayer.
  @nullable
  int get ishaMinutesAdjustment;
}
