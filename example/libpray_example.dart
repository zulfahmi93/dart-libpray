import 'package:libpray/libpray.dart';

void main() {
  // Use April 12th, 2018.
  const int year = 2018;
  const int month = 4;
  const int day = 12;
  final DateTime when = new DateTime.utc(year, month, day);

  // Init settings.
  final PrayerCalculationSettings settings = new PrayerCalculationSettings();

  // Set calculation method to JAKIM (Fajr: 18.0 and Isha: 20.0).
  settings.calculationMethod.setCalculationMethodPreset(when, CalculationMethodPreset.departmentOfIslamicAdvancementOfMalaysia);

  // Init location info.
  const Geocoordinate geo = const Geocoordinate(2.0, 101.0, 2.0);
  const double timezone = 8.0;

  // Generate prayer times for one day on April 12th, 2018.
  final Prayers prayers = Prayers.on(when, settings, geo, timezone);
  print(prayers.imsak);
  print(prayers.fajr);
  print(prayers.sunrise);
  print(prayers.dhuha);
  print(prayers.dhuhr);
  print(prayers.asr);
  print(prayers.sunset);
  print(prayers.maghrib);
  print(prayers.isha);
  print(prayers.midnight);

  // Generate current prayer time
  final Prayer current = Prayer.now(settings, geo, timezone);
  print('${current.type}: ${current.time}');

  // Generate next prayer time
  final Prayer next = Prayer.next(settings, geo, timezone);
  print('${next.type}: ${next.time}');

  // Generate later prayer time
  final Prayer later = Prayer.later(settings, geo, timezone);
  print('${later.type}: ${later.time}');

  // Generate after later prayer time
  final Prayer afterLater = Prayer.afterLater(settings, geo, timezone);
  print('${afterLater.type}: ${afterLater.time}');
}
