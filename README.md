# Muslim Prayer Times Library for Dart

## Quick Start

1. Open your `pubspec.yaml` file and add this entry:

    ```yaml
    libpray: ^0.0.1
    ```

2. Then run `pub get`.
3. Import this library into your code:

    ```dart
    import 'package:libpray/libpray.dart';
    ```


## How Prayer Times Are Calculated

### Astronomical Measures

#### Equation of Time

The equation of time describes the difference of mean solar time (as shown by the clock) and apparent solar time (as shown by sundial). The equation of time is due to two phenomena; the Earth's rotational axis tilt of 23.5° and the elliptical orbit of the Earth [2].

![Equation of Time](https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Equation_of_time.svg/310px-Equation_of_time.svg.png)

As shown in the graph, apparent time can be ahead of mean time by as much as 16 minutes and 33 seconds (around November 3rd) or can be behind by as much as 14 minutes and 6 seconds (around February 12th).

The equation of time can be calculated using the following formula [3]:

1. Compute the numbers of days and fraction, denoted as `D`, from J2000.0 epoch which is equivalent to January 1.5, 2000 in Gregorian or 2451545.0 in Julian Date:

    ```dart
    D = JD - 2451545.0
    ```

    where `JD` is the Julian Date of interest.

2. Then, compute:

    ```dart
    // The mean anomaly of the sun, `g`.
    g = 357.529 + (0.98560028 * D)

    // The mean longitude of the sun, `q`.
    q = 280.459 + (0.98564736 * D)

    // The geocentric apparent ecliptic longitude of the sun (adjusted for aberration), L.
    L = q + (1.915 * sin(g)) + (0.020 * sin(2 * g))
    ```

    > All constants are in degrees therefore `g`, `q` and `L`. Computed `g`, `q` and `L` must be reduced to the range of `0°` to `360°`.

3. Compute the mean obliquity of the ecliptic in degrees, `e`:

    ```dart
    e = 23.439 - (0.0000003.6 * D)
    ```

4. Once the apparent ecliptic longitude of the sun, `L`, and the mean obliquity of the ecliptic, `e` have been computed, the right ascension, `RA` of the sun can be calculated:

    ```dart
    RA = atan2(cos(e) * sin(L), cos(L))
    ```

5. Thus, equation of time can be obtained as follows:

    ```dart
    EqT = (q / 15) - RA
    ```

#### Declination of Sun

The declination of the Sun is the measurement of the angle between the Sun’s rays and the Earth’s equatorial plane. This principle is used to explain why the earth experience different seasons which are four in some countries and only two in the others.

The Earth’s axis is tilted by 23.5 degrees away from the solar plane. The Sun’s declination varies throughout the year. Its declination becomes zero during the spring equinox and reaches the maximum declination angle of 23.5 degrees during the summer solstice. It reverts to zero declination when fall equinox comes and drops to the negative 23.5 declination during the winter solstice [4][5].

The sun's declination can be computed using the formula stated above from step 1 until step 3. Then, the declination, `d` can be obtained by:

```dart
d = asin(sin(e) * sin(L))
```

#### Time of Sun at Given Angle Below Horizon

The following formula can be used to calculate the difference of time between the mid day and the time when the sun reaches the `α` angle below the horizon, `T(α)` [1]:

```dart
T(α) = acos((-sin(α) - (sin(d) * sin(latitude))) / (cos(d) * cos(latitude))) / 15
```

### Adjustments

This library uses the following formula for applying adjustment to the calculated prayer times (denoted as `adj`):

```dart
adj = timezone - longitude / 15
```

### Dhuhr

Dhuhr prayer time arrives when the sun begins to decline after reaching its highest point on the sky [1]. To compute dhuhr prayer time, first, the time of the mid day is calculated:

```dart
midday = 12 - EqT
```

Then, by adding adjustment, `adj` to the calculated mid day time, we can obtained the dhuhr prayer time:

```dart
dhuhr = midday + adj
```

This library, additionally, added 65 seconds to the calculated dhuhr time above as we use the following fiqh method:

> Dhuhr is when the Sun's disk comes out of its zenith line, which is a line between the observer and the center of the Sun when it is at the highest point [6].

### Fajr and Isha

To calculate fajr and isha prayer times, these parameters are required:
- The sun declination, `d`.
- The midday time, `midday`.
- Sun angle, `α` for fajr and isha.
- Location's latitude, `latitude`.

First, `T(α)` is calculated using [this formula](#time-of-sun-at-given-angle-below-horizon). Then, the fajr time can be obtained by subtracting calculated `T(α)` from the `midday`:

```dart
fajr = midday - T(α)
```

The isha time can be obtained by adding calculated `T(α)` to the `midday`:

```dart
isha = midday + T(α)
```

There are several opinions about the angle to be used for calculating fajr and isha prayer times. The following table shows the methods offered by this library including their fajr and isha angles used:

| Method                                              | Fajr angle | Isha angle |
| --------------------------------------------------- | ---------- | ---------- |
| Muslim World League                                 | 18.0       | 17.0       |
| Islamic Society of North America                    | 15.0       | 15.0       |
| Egyptian General Authority of Survey                | 19.5       | 17.5       |
| Umm Al-Qura University, Mecca                       | 18.5*      | N/A**      |
| University of Islamic Sciences, Karachi             | 18.0       | 18.0       |
| Union des Organisations Islamiques de France        | 12.0       | 12.0       |
| Majlis Ugama Islam Singapura                        | 20.0       | 18.0       |
| Department of Islamic Advancement, Malaysia (JAKIM) | 20.0       | 18.0       |
| Ithna Ashari                                        | 16.0       | 14.0       |
| Institute of Geophysics, University of Tehran       | 17.7       | 14.0***    |

>\* Umm Al-Qura University, Mecca uses fajr angle of 19.0 before year 1430 in Islamic calendar.

>\** Umm Al-Qura University, Mecca does not specifies isha angle as it just add 90 minutes (120 in Ramadan) to the maghrib prayer time for obtaining isha prayer time.

> \*** Isha angle is not explicitly defined in method by Institute of Geophysics, University of Tehran.

### Sunrise and Sunset

The astronomical sunrise and sunset occur at `α = 0`. Due to the refraction of light by terrestrial atmosphere, actual sunrise appears slightly before astronomical sunrise and actual sunset occurs slightly after astronomical sunset. Thus, to get the actual sunrise and sunset, the angle `α` starts from a value of `0.833` [1]. If the elevation is greater than `0`, the angle can be calculated as follows:

```dart
α = 0.833 + (0.0347 * sqrt(elevation))
```

Then, the actual sunrise and sunset can be calculated as follows:

```dart
// Sunrise.
sunrise = midday - T(α)

// Sunset.
sunset = midday + T(α)
```

### Asr

There are two main opinions for computing asr prayer time. Majority of fiqh's school (Shafi'i, Maliki and Hanbali) say that the asr prayer time is when the shadow's length of any object is equal to the length of the object itself plus the shadow's length of that object at noon [1].

First, the angle, `α` is calculated using this formula:

```dart
// For shafi'i, maliki and hanbali, t = 1 while hanafi, t = 2
t = 1
α = -arccot(t + tan(latitude - d))
```

Then, asr prayer time is obtained using the following formula:
```dart
asr = midday + T(α)
```

### Maghrib

From point view of Sunni, the beginning of the maghrib prayer time is once the sun has completely set beneath the horizon, which can be deduced as the same as the sunset time. This library add 1 minute to the sunset time as precaution. In Shia's point of view, the dominant opinion is that as long as the redness of the eastern sky which appears after sunset has not passed overhead, maghrib prayer should not be performed [1]. Usually, the calculate maghrib prayer time like the isha prayer time is calculated except the angle is replaced with the twilight angle:

```
α = twilight_angle
maghrib = midday + T(α)
```

The following table shows the angle used by Shia method:

| Method                                        | Twilight angle |
| --------------------------------------------- | -------------- |
| Ithna Ashari                                  | 4.0            |
| Institute of Geophysics, University of Tehran | 4.5            |

### Dhuha

Dhuha time arrives when a third of sunrise and fajr time difference is added to the sunrise time [7]. Thus, this library calculate the dhuha time as follows:

```dart
diff = sunrise - fajr
dhuha = sunrise + (diff / 3)
```

### Midnight

Midnight is generally calculated as the mean time from sunset to sunrise of the next day [1]:

```dart
diff = sunrise - sunset
midnight = sunset + (diff / 2)
```

However, in Shia point of view, the midnight (juridical midnight, the ending time for performing isha prayer) is calculated as the mean time from sunset to fajr [1]:

```dart
diff = fajr - sunset
midnight = sunset + (diff / 2)
```

## Example

```dart
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
```

## References

1. "Prayer Times Calculation", _Pray Times_, 2018. [Online]. Available: http://praytimes.org/calculation. [Accessed: 13- Apr- 2018].

2. "Equation of time", _Wikipedia_, 2018. [Online]. Available: https://en.wikipedia.org/wiki/Equation_of_time. [Accessed: 13- Apr- 2018].

3. "Approximate Solar Coordinates", _Astronomical Applications Department of the U.S. Naval Observatory_, 2018. [Online]. Available: http://aa.usno.navy.mil/faq/docs/SunApprox.php. [Accessed: 13- Apr- 2018].

4. J. Rocheleau, "Declination Of The Sun", _Planet Facts_, 2018. [Online]. Available: http://planetfacts.org/declination-of-the-sun/. [Accessed: 13- Apr- 2018].

5. "Position of the Sun", _Wikipedia_, 2018. [Online]. Available: https://en.wikipedia.org/wiki/Position_of_the_Sun. [Accessed: 13- Apr- 2018].

6. "A note on Dhuhr", _Pray Times_, 2018. [Online]. Available: http://praytimes.org/wiki/A_note_on_Dhuhr. [Accessed: 13- Apr- 2018].

7. "Tafsiran Astronomi Untuk Waktu Solat", _e-Solat: Sistem Panduan Solat_, 2014. [Online]. Available: http://www.e-solat.gov.my/web/index1.php?id=55&type=A. [Accessed: 13- Apr- 2018].

## Features and Bugs

Please file feature requests and bugs at the [issue tracker][tracker].


## License

This project is licensed under the MIT License - see the [LICENSE][license] file for details.

[tracker]: https://github.com/zulfahmi93/dart_libpray/issues
[license]: LICENSE
