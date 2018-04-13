import 'package:libpray/libpray.dart';
import 'package:test/test.dart';

void testCalculationMethod() {
  group('calculation_method.dart tests.', () {
    _testSetPresetIthnaAshari();
    _testSetPresetUniversityOfIslamicSciencesKarachi();
    _testSetPresetIslamicSocietyOfNorthAmerica();
    _testSetPresetMuslimWorldLeague();
    _testSetPresetUmmAlQuraUniversityOnMuharram1st1425H();
    _testSetPresetUmmAlQuraUniversityOnRamadhan1st1425H();
    _testSetPresetUmmAlQuraUniversityOnMuharram1st1435H();
    _testSetPresetUmmAlQuraUniversityOnRamadhan1st1435H();
    _testSetPresetEgyptianGeneralAuthorityOfSurvey();
    _testSetPresetInstituteOfGeophysicsUniversityOfTehran();
    _testSetPresetUnionDesOrganisationsIslamiquesDeFrance();
    _testSetPresetMajlisUgamaIslamSingapura();
    _testSetPresetDepartmentOfIslamicAdvancementOfMalaysia();
    _testSetPresetUmmAlQuraUniversityDateError();
    _testInvalidPresetError();
    _testSetCustomParameter();
    _testGetIthnaAshariPreset();
    _testGetUniversityOfIslamicSciencesKarachiPreset();
    _testGetIslamicSocietyOfNorthAmericaPreset();
    _testGetMuslimWorldLeaguePreset();
    _testGetUmmAlQuraUniversityPreset();
    _testGetEgyptianGeneralAuthorityOfSurveyPreset();
    _testGetUnionDesOrganisationsIslamiquesDeFrancePreset();
    _testGetMajlisUgamaIslamSingapuraPreset();
    _testGetInstituteOfGeophysicsUniversityOfTehranPreset();
  });
}

void _testSetPresetIthnaAshari() {
  test('Test set CalculationMethod preset to Ithna Ashari.', () {
    final CalculationMethod method = new CalculationMethod()
      ..setCalculationMethodPreset(
          new DateTime.now().toUtc(), CalculationMethodPreset.ithnaAshari);

    expect(method.preset, equals(CalculationMethodPreset.ithnaAshari));
    expect(method.fajrParameter.value, equals(16.0));
    expect(method.fajrParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(4.0));
    expect(method.maghribParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.ishaParameter.value, equals(14.0));
    expect(method.ishaParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.midnight, equals(Midnight.jafari));
  });
}

void _testSetPresetUniversityOfIslamicSciencesKarachi() {
  test(
      'Test set CalculationMethod preset to University of Islamic Sciences, Karachi.',
      () {
    final CalculationMethod method = new CalculationMethod()
      ..setCalculationMethodPreset(new DateTime.now().toUtc(),
          CalculationMethodPreset.universityOfIslamicSciencesKarachi);

    expect(method.preset,
        equals(CalculationMethodPreset.universityOfIslamicSciencesKarachi));
    expect(method.fajrParameter.value, equals(18.0));
    expect(method.fajrParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type,
        equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(18.0));
    expect(method.ishaParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetIslamicSocietyOfNorthAmerica() {
  test('Test set CalculationMethod preset to Islamic Society of North America.',
      () {
    final CalculationMethod method = new CalculationMethod()
      ..setCalculationMethodPreset(new DateTime.now().toUtc(),
          CalculationMethodPreset.islamicSocietyOfNorthAmerica);

    expect(method.preset,
        equals(CalculationMethodPreset.islamicSocietyOfNorthAmerica));
    expect(method.fajrParameter.value, equals(15.0));
    expect(method.fajrParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type,
        equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(15.0));
    expect(method.ishaParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetMuslimWorldLeague() {
  test('Test set CalculationMethod preset to Muslim World League.', () {
    final CalculationMethod method = new CalculationMethod()
      ..setCalculationMethodPreset(new DateTime.now().toUtc(),
          CalculationMethodPreset.muslimWorldLeague);

    expect(method.preset, equals(CalculationMethodPreset.muslimWorldLeague));
    expect(method.fajrParameter.value, equals(18.0));
    expect(method.fajrParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type,
        equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(17.0));
    expect(method.ishaParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetUmmAlQuraUniversityOnMuharram1st1425H() {
  test(
      'Test set CalculationMethod preset to Ummul Qura for Muharram 1st, 1425H.',
      () {
    final CalculationMethod method = new CalculationMethod()
      ..setCalculationMethodPreset(new DateTime.utc(2004, 2, 22),
          CalculationMethodPreset.ummAlQuraUniversity);

    expect(method.preset, equals(CalculationMethodPreset.ummAlQuraUniversity));
    expect(method.fajrParameter.value, equals(19.0));
    expect(method.fajrParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type,
        equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(90.0));
    expect(method.ishaParameter.type,
        equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetUmmAlQuraUniversityOnRamadhan1st1425H() {
  test(
      'Test set CalculationMethod preset to Ummul Qura for Ramadhan 1st, 1425H.',
      () {
    final CalculationMethod method = new CalculationMethod()
      ..setCalculationMethodPreset(new DateTime.utc(2004, 10, 15),
          CalculationMethodPreset.ummAlQuraUniversity);

    expect(method.preset, equals(CalculationMethodPreset.ummAlQuraUniversity));
    expect(method.fajrParameter.value, equals(19.0));
    expect(method.fajrParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type,
        equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(120.0));
    expect(method.ishaParameter.type,
        equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetUmmAlQuraUniversityOnMuharram1st1435H() {
  test(
      'Test set CalculationMethod preset to Ummul Qura for Muharram 1st, 1435H.',
      () {
    final CalculationMethod method = new CalculationMethod()
      ..setCalculationMethodPreset(new DateTime.utc(2013, 11, 5),
          CalculationMethodPreset.ummAlQuraUniversity);

    expect(method.preset, equals(CalculationMethodPreset.ummAlQuraUniversity));
    expect(method.fajrParameter.value, equals(18.5));
    expect(method.fajrParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type,
        equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(90.0));
    expect(method.ishaParameter.type,
        equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetUmmAlQuraUniversityOnRamadhan1st1435H() {
  test(
      'Test set CalculationMethod preset to Ummul Qura for Ramadhan 1st, 1435H.',
      () {
    final CalculationMethod method = new CalculationMethod()
      ..setCalculationMethodPreset(new DateTime.utc(2014, 6, 29),
          CalculationMethodPreset.ummAlQuraUniversity);

    expect(method.preset, equals(CalculationMethodPreset.ummAlQuraUniversity));
    expect(method.fajrParameter.value, equals(18.5));
    expect(method.fajrParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type,
        equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(120.0));
    expect(method.ishaParameter.type,
        equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetEgyptianGeneralAuthorityOfSurvey() {
  test(
      'Test set CalculationMethod preset to Egyptian General Authority of Survey.',
      () {
    final CalculationMethod method = new CalculationMethod()
      ..setCalculationMethodPreset(new DateTime.now().toUtc(),
          CalculationMethodPreset.egyptianGeneralAuthorityOfSurvey);

    expect(method.preset,
        equals(CalculationMethodPreset.egyptianGeneralAuthorityOfSurvey));
    expect(method.fajrParameter.value, equals(19.5));
    expect(method.fajrParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type,
        equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(17.5));
    expect(method.ishaParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetInstituteOfGeophysicsUniversityOfTehran() {
  test(
      'Test set CalculationMethod preset to Institute of Geophysics, University of Tehran.',
      () {
    final CalculationMethod method = new CalculationMethod()
      ..setCalculationMethodPreset(new DateTime.now().toUtc(),
          CalculationMethodPreset.instituteOfGeophysicsUniversityOfTehran);

    expect(
        method.preset,
        equals(
            CalculationMethodPreset.instituteOfGeophysicsUniversityOfTehran));
    expect(method.fajrParameter.value, equals(17.7));
    expect(method.fajrParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(4.5));
    expect(method.maghribParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.ishaParameter.value, equals(14.0));
    expect(method.ishaParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.midnight, equals(Midnight.jafari));
  });
}

void _testSetPresetUnionDesOrganisationsIslamiquesDeFrance() {
  test(
      'Test set CalculationMethod preset to Union des Organisations Islamiques de France.',
      () {
    final CalculationMethod method = new CalculationMethod()
      ..setCalculationMethodPreset(new DateTime.now().toUtc(),
          CalculationMethodPreset.unionDesOrganisationsIslamiquesDeFrance);

    expect(
        method.preset,
        equals(
            CalculationMethodPreset.unionDesOrganisationsIslamiquesDeFrance));
    expect(method.fajrParameter.value, equals(12.0));
    expect(method.fajrParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type,
        equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(12.0));
    expect(method.ishaParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetMajlisUgamaIslamSingapura() {
  test('Test set CalculationMethod preset to Majlis Ugama Islam Singapura.',
      () {
    final CalculationMethod method = new CalculationMethod()
      ..setCalculationMethodPreset(new DateTime.now().toUtc(),
          CalculationMethodPreset.majlisUgamaIslamSingapura);

    expect(method.preset,
        equals(CalculationMethodPreset.majlisUgamaIslamSingapura));
    expect(method.fajrParameter.value, equals(20.0));
    expect(method.fajrParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type,
        equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(18.0));
    expect(method.ishaParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetDepartmentOfIslamicAdvancementOfMalaysia() {
  test(
      'Test set CalculationMethod preset to Department of Islamic Advancement, Malaysia..',
      () {
    final CalculationMethod method = new CalculationMethod()
      ..setCalculationMethodPreset(new DateTime.now().toUtc(),
          CalculationMethodPreset.departmentOfIslamicAdvancementOfMalaysia);

    expect(
        method.preset,
        equals(
            CalculationMethodPreset.departmentOfIslamicAdvancementOfMalaysia));
    expect(method.fajrParameter.value, equals(20.0));
    expect(method.fajrParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type,
        equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(18.0));
    expect(method.ishaParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetUmmAlQuraUniversityDateError() {
  test(
      'Test set CalculationMethod preset to Ummul Qura with non-UTC date should throw error.',
      () {
    final CalculationMethod method = new CalculationMethod();
    expect(() {
      method.setCalculationMethodPreset(new DateTime(2004, 2, 22),
          CalculationMethodPreset.ummAlQuraUniversity);
    }, throwsA(const isInstanceOf<ArgumentError>()));
  });
}

void _testInvalidPresetError() {
  test('Test set CalculationMethod to invalid preset should throw error.', () {
    final CalculationMethod method = new CalculationMethod();
    expect(() {
      method.setCalculationMethodPreset(
          new DateTime(2004, 2, 22), CalculationMethodPreset.custom);
    }, throwsA(const isInstanceOf<ArgumentError>()));
  });
}

void _testSetCustomParameter() {
  test('Test set CalculationMethod using custom calculation parameter.', () {
    final CalculationMethod method = new CalculationMethod()
      ..setCustomCalculationMethod(
          13.0,
          0.5,
          PrayerCalculationParameterType.minutesAdjust,
          13.5,
          PrayerCalculationParameterType.angle,
          Midnight.standard);

    expect(method.preset, equals(CalculationMethodPreset.custom));
    expect(method.fajrParameter.value, equals(13.0));
    expect(method.fajrParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.5));
    expect(method.maghribParameter.type,
        equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(13.5));
    expect(method.ishaParameter.type,
        equals(PrayerCalculationParameterType.angle));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testGetIthnaAshariPreset() {
  test('Test get Ithna Ashari CalculationMethod preset.', () {
    final CalculationMethod method = new CalculationMethod()
      ..setCustomCalculationMethod(
          16.0,
          4.0,
          PrayerCalculationParameterType.angle,
          14.0,
          PrayerCalculationParameterType.angle,
          Midnight.jafari);

    expect(method.getCalculationMethodPreset(),
        equals(CalculationMethodPreset.ithnaAshari));
  });
}

void _testGetUniversityOfIslamicSciencesKarachiPreset() {
  test(
      'Test get University of Islamic Sciences, Karachi CalculationMethod preset.',
      () {
    final CalculationMethod method = new CalculationMethod()
      ..setCustomCalculationMethod(
          18.0,
          0.0,
          PrayerCalculationParameterType.minutesAdjust,
          18.0,
          PrayerCalculationParameterType.angle,
          Midnight.standard);

    expect(method.getCalculationMethodPreset(),
        equals(CalculationMethodPreset.universityOfIslamicSciencesKarachi));
  });
}

void _testGetIslamicSocietyOfNorthAmericaPreset() {
  test('Test get Islamic Society of North America CalculationMethod preset.',
      () {
    final CalculationMethod method = new CalculationMethod()
      ..setCustomCalculationMethod(
          15.0,
          0.0,
          PrayerCalculationParameterType.minutesAdjust,
          15.0,
          PrayerCalculationParameterType.angle,
          Midnight.standard);

    expect(method.getCalculationMethodPreset(),
        equals(CalculationMethodPreset.islamicSocietyOfNorthAmerica));
  });
}

void _testGetMuslimWorldLeaguePreset() {
  test('Test get Muslim World League CalculationMethod preset.', () {
    final CalculationMethod method = new CalculationMethod()
      ..setCustomCalculationMethod(
          18.0,
          0.0,
          PrayerCalculationParameterType.minutesAdjust,
          17.0,
          PrayerCalculationParameterType.angle,
          Midnight.standard);

    expect(method.getCalculationMethodPreset(),
        equals(CalculationMethodPreset.muslimWorldLeague));
  });
}

void _testGetUmmAlQuraUniversityPreset() {
  test('Test get Umm Al-Qura University, Makkah CalculationMethod preset.', () {
    final CalculationMethod method1 = new CalculationMethod()
      ..setCustomCalculationMethod(
          19.0,
          0.0,
          PrayerCalculationParameterType.minutesAdjust,
          90.0,
          PrayerCalculationParameterType.minutesAdjust,
          Midnight.standard);
    final CalculationMethod method2 = new CalculationMethod()
      ..setCustomCalculationMethod(
          19.0,
          0.0,
          PrayerCalculationParameterType.minutesAdjust,
          120.0,
          PrayerCalculationParameterType.minutesAdjust,
          Midnight.standard);
    final CalculationMethod method3 = new CalculationMethod()
      ..setCustomCalculationMethod(
          18.5,
          0.0,
          PrayerCalculationParameterType.minutesAdjust,
          90.0,
          PrayerCalculationParameterType.minutesAdjust,
          Midnight.standard);
    final CalculationMethod method4 = new CalculationMethod()
      ..setCustomCalculationMethod(
          18.5,
          0.0,
          PrayerCalculationParameterType.minutesAdjust,
          120.0,
          PrayerCalculationParameterType.minutesAdjust,
          Midnight.standard);

    expect(method1.getCalculationMethodPreset(),
        equals(CalculationMethodPreset.ummAlQuraUniversity));
    expect(method2.getCalculationMethodPreset(),
        equals(CalculationMethodPreset.ummAlQuraUniversity));
    expect(method3.getCalculationMethodPreset(),
        equals(CalculationMethodPreset.ummAlQuraUniversity));
    expect(method4.getCalculationMethodPreset(),
        equals(CalculationMethodPreset.ummAlQuraUniversity));
  });
}

void _testGetEgyptianGeneralAuthorityOfSurveyPreset() {
  test(
      'Test get Egyptian General Authority of Survey CalculationMethod preset.',
      () {
    final CalculationMethod method = new CalculationMethod()
      ..setCustomCalculationMethod(
          19.5,
          0.0,
          PrayerCalculationParameterType.minutesAdjust,
          17.5,
          PrayerCalculationParameterType.angle,
          Midnight.standard);

    expect(method.getCalculationMethodPreset(),
        equals(CalculationMethodPreset.egyptianGeneralAuthorityOfSurvey));
  });
}

void _testGetUnionDesOrganisationsIslamiquesDeFrancePreset() {
  test(
      'Test get Union des Organisations Islamiques de France CalculationMethod preset.',
      () {
    final CalculationMethod method = new CalculationMethod()
      ..setCustomCalculationMethod(
          12.0,
          0.0,
          PrayerCalculationParameterType.minutesAdjust,
          12.0,
          PrayerCalculationParameterType.angle,
          Midnight.standard);

    expect(
        method.getCalculationMethodPreset(),
        equals(
            CalculationMethodPreset.unionDesOrganisationsIslamiquesDeFrance));
  });
}

void _testGetMajlisUgamaIslamSingapuraPreset() {
  test('Test get Majlis Ugama Islam Singapura CalculationMethod preset.', () {
    final CalculationMethod method = new CalculationMethod()
      ..setCustomCalculationMethod(
          20.0,
          0.0,
          PrayerCalculationParameterType.minutesAdjust,
          18.0,
          PrayerCalculationParameterType.angle,
          Midnight.standard);

    expect(method.getCalculationMethodPreset(),
        equals(CalculationMethodPreset.majlisUgamaIslamSingapura));
  });
}

void _testGetInstituteOfGeophysicsUniversityOfTehranPreset() {
  test(
      'Test get Institute of Geophysics, University of Tehran CalculationMethod preset.',
      () {
    final CalculationMethod method = new CalculationMethod()
      ..setCustomCalculationMethod(
          17.7,
          4.5,
          PrayerCalculationParameterType.angle,
          14.0,
          PrayerCalculationParameterType.angle,
          Midnight.jafari);

    expect(
        method.getCalculationMethodPreset(),
        equals(
            CalculationMethodPreset.instituteOfGeophysicsUniversityOfTehran));
  });
}
