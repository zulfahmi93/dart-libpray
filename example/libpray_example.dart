import 'package:libpray/libpray.dart';

void main() {
  // Use April 12th, 2018.
  const int year = 2018;
  const int month = 4;
  const int day = 12;
  final DateTime when = DateTime.utc(year, month, day);

  // Init settings.
  // Set calculation method to JAKIM (Fajr: 18.0 and Isha: 20.0).
  final PrayerCalculationSettings settings = PrayerCalculationSettings((PrayerCalculationSettingsBuilder b) =>
      b..calculationMethod.replace(CalculationMethod.fromPreset(preset: CalculationMethodPreset.departmentOfIslamicAdvancementOfMalaysia)));

  // Init location info.
  final Geocoordinate geo = Geocoordinate((GeocoordinateBuilder b) => b
    ..latitude = 2.0
    ..longitude = 101.0
    ..altitude = 2.0);
  const double timezone = 8.0;

  // Generate prayer times for one day on April 12th, 2018.
  final Prayers prayers = Prayers.on(date: when, settings: settings, coordinate: geo, timeZone: timezone);
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
  final Prayer current = Prayer.now(settings: settings, coordinate: geo, timeZone: timezone);
  print('${current.type}: ${current.time}');

  // Generate next prayer time
  final Prayer next = Prayer.next(settings: settings, coordinate: geo, timeZone: timezone);
  print('${next.type}: ${next.time}');

  // Generate later prayer time
  final Prayer later = Prayer.later(settings: settings, coordinate: geo, timeZone: timezone);
  print('${later.type}: ${later.time}');

  // Generate after later prayer time
  final Prayer afterLater = Prayer.afterLater(settings: settings, coordinate: geo, timeZone: timezone);
  print('${afterLater.type}: ${afterLater.time}');
}
