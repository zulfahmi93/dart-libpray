import 'calculation_method.dart';
import 'high_latitude_adjustment.dart';
import 'juristic_method.dart';

///
/// Provides properties for holding information used for calculating prayer
/// times. Provides method for searching prayer times calculation settings from
/// given location information.
///
class PrayerCalculationSettings {
  /* BEGIN FIELD SECTION */

  ///
  /// Gets or sets the calculation parameter for imsak prayer.
  ///
  PrayerCalculationParameter imsakParameter = const PrayerCalculationParameter(
      -10.0, PrayerCalculationParameterType.minutesAdjust);

  ///
  /// Gets or sets the calculation method for calculating fajr, maghrib and
  /// isha prayers.
  ///
  CalculationMethod calculationMethod = new CalculationMethod();

  ///
  /// Gets or sets the juristic method for calculating asr prayer.
  ///
  JuristicMethod juristicMethod = new JuristicMethod();

  ///
  /// Gets or sets high latitude adjustment method for adjusting imsak, fajr,
  /// maghrib and isha prayer times at a high latitude location.
  ///
  HighLatitudeAdjustment highLatitudeAdjustment =
      HighLatitudeAdjustment.none;

  ///
  /// Gets or sets the minute adjustment parameter for imsak prayer.
  ///
  int imsakMinutesAdjustment = 0;

  ///
  /// Gets or sets the minute adjustment parameter for fajr prayer.
  ///
  int fajrMinutesAdjustment = 0;

  ///
  /// Gets or sets the minute adjustment parameter for sunrise prayer.
  ///
  int sunriseMinutesAdjustment = 0;

  ///
  /// Gets or sets the minute adjustment parameter for dhuha prayer.
  ///
  int dhuhaMinutesAdjustment = 0;

  ///
  /// Gets or sets the minute adjustment parameter for dhuhr prayer.
  ///
  int dhuhrMinutesAdjustment = 0;

  ///
  /// Gets or sets the minute adjustment parameter for asr prayer.
  ///
  int asrMinutesAdjustment = 0;

  ///
  /// Gets or sets the minute adjustment parameter for maghrib prayer.
  ///
  int maghribMinutesAdjustment = 0;

  ///
  /// Gets or sets the minute adjustment parameter for isha prayer.
  ///
  int ishaMinutesAdjustment = 0;

  /* END FIELD SECTION */
  /* BEGIN CONSTRUCTOR SECTION */

  ///
  /// Create new [PrayerCalculationSettings].
  ///
  PrayerCalculationSettings();

/* END CONSTRUCTOR SECTION */
}
