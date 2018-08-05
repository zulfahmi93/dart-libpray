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
  });
}

void _testSetPresetIthnaAshari() {
  test('Test set CalculationMethod preset to Ithna Ashari.', () {
    final CalculationMethod method = CalculationMethod.fromPreset(preset: CalculationMethodPreset.ithnaAshari, when: DateTime.now().toUtc());

    expect(method.preset, equals(CalculationMethodPreset.ithnaAshari));
    expect(method.fajrParameter.value, equals(16.0));
    expect(method.fajrParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(4.0));
    expect(method.maghribParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.ishaParameter.value, equals(14.0));
    expect(method.ishaParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.midnight, equals(Midnight.jafari));
  });
}

void _testSetPresetUniversityOfIslamicSciencesKarachi() {
  test('Test set CalculationMethod preset to University of Islamic Sciences, Karachi.', () {
    final CalculationMethod method =
        CalculationMethod.fromPreset(preset: CalculationMethodPreset.universityOfIslamicSciencesKarachi, when: DateTime.now().toUtc());

    expect(method.preset, equals(CalculationMethodPreset.universityOfIslamicSciencesKarachi));
    expect(method.fajrParameter.value, equals(18.0));
    expect(method.fajrParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type, equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(18.0));
    expect(method.ishaParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetIslamicSocietyOfNorthAmerica() {
  test('Test set CalculationMethod preset to Islamic Society of North America.', () {
    final CalculationMethod method =
        CalculationMethod.fromPreset(preset: CalculationMethodPreset.islamicSocietyOfNorthAmerica, when: DateTime.now().toUtc());

    expect(method.preset, equals(CalculationMethodPreset.islamicSocietyOfNorthAmerica));
    expect(method.fajrParameter.value, equals(15.0));
    expect(method.fajrParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type, equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(15.0));
    expect(method.ishaParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetMuslimWorldLeague() {
  test('Test set CalculationMethod preset to Muslim World League.', () {
    final CalculationMethod method = CalculationMethod.fromPreset(preset: CalculationMethodPreset.muslimWorldLeague, when: DateTime.now().toUtc());

    expect(method.preset, equals(CalculationMethodPreset.muslimWorldLeague));
    expect(method.fajrParameter.value, equals(18.0));
    expect(method.fajrParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type, equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(17.0));
    expect(method.ishaParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetUmmAlQuraUniversityOnMuharram1st1425H() {
  test('Test set CalculationMethod preset to Ummul Qura for Muharram 1st, 1425H.', () {
    final CalculationMethod method = CalculationMethod.fromPreset(preset: CalculationMethodPreset.ummAlQuraUniversity, when: DateTime.utc(2004, 2, 22));

    expect(method.preset, equals(CalculationMethodPreset.ummAlQuraUniversity));
    expect(method.fajrParameter.value, equals(19.0));
    expect(method.fajrParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type, equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(90.0));
    expect(method.ishaParameter.type, equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetUmmAlQuraUniversityOnRamadhan1st1425H() {
  test('Test set CalculationMethod preset to Ummul Qura for Ramadhan 1st, 1425H.', () {
    final CalculationMethod method =
        CalculationMethod.fromPreset(preset: CalculationMethodPreset.ummAlQuraUniversity, when: DateTime.utc(2004, 10, 15));

    expect(method.preset, equals(CalculationMethodPreset.ummAlQuraUniversity));
    expect(method.fajrParameter.value, equals(19.0));
    expect(method.fajrParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type, equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(120.0));
    expect(method.ishaParameter.type, equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetUmmAlQuraUniversityOnMuharram1st1435H() {
  test('Test set CalculationMethod preset to Ummul Qura for Muharram 1st, 1435H.', () {
    final CalculationMethod method = CalculationMethod.fromPreset(preset: CalculationMethodPreset.ummAlQuraUniversity, when: DateTime.utc(2013, 11, 5));

    expect(method.preset, equals(CalculationMethodPreset.ummAlQuraUniversity));
    expect(method.fajrParameter.value, equals(18.5));
    expect(method.fajrParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type, equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(90.0));
    expect(method.ishaParameter.type, equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetUmmAlQuraUniversityOnRamadhan1st1435H() {
  test('Test set CalculationMethod preset to Ummul Qura for Ramadhan 1st, 1435H.', () {
    final CalculationMethod method = CalculationMethod.fromPreset(preset: CalculationMethodPreset.ummAlQuraUniversity, when: DateTime.utc(2014, 6, 29));

    expect(method.preset, equals(CalculationMethodPreset.ummAlQuraUniversity));
    expect(method.fajrParameter.value, equals(18.5));
    expect(method.fajrParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type, equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(120.0));
    expect(method.ishaParameter.type, equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetEgyptianGeneralAuthorityOfSurvey() {
  test('Test set CalculationMethod preset to Egyptian General Authority of Survey.', () {
    final CalculationMethod method =
        CalculationMethod.fromPreset(preset: CalculationMethodPreset.egyptianGeneralAuthorityOfSurvey, when: DateTime.now().toUtc());

    expect(method.preset, equals(CalculationMethodPreset.egyptianGeneralAuthorityOfSurvey));
    expect(method.fajrParameter.value, equals(19.5));
    expect(method.fajrParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type, equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(17.5));
    expect(method.ishaParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetInstituteOfGeophysicsUniversityOfTehran() {
  test('Test set CalculationMethod preset to Institute of Geophysics, University of Tehran.', () {
    final CalculationMethod method =
        CalculationMethod.fromPreset(preset: CalculationMethodPreset.instituteOfGeophysicsUniversityOfTehran, when: DateTime.now().toUtc());

    expect(method.preset, equals(CalculationMethodPreset.instituteOfGeophysicsUniversityOfTehran));
    expect(method.fajrParameter.value, equals(17.7));
    expect(method.fajrParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(4.5));
    expect(method.maghribParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.ishaParameter.value, equals(14.0));
    expect(method.ishaParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.midnight, equals(Midnight.jafari));
  });
}

void _testSetPresetUnionDesOrganisationsIslamiquesDeFrance() {
  test('Test set CalculationMethod preset to Union des Organisations Islamiques de France.', () {
    final CalculationMethod method =
        CalculationMethod.fromPreset(preset: CalculationMethodPreset.unionDesOrganisationsIslamiquesDeFrance, when: DateTime.now().toUtc());

    expect(method.preset, equals(CalculationMethodPreset.unionDesOrganisationsIslamiquesDeFrance));
    expect(method.fajrParameter.value, equals(12.0));
    expect(method.fajrParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type, equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(12.0));
    expect(method.ishaParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetMajlisUgamaIslamSingapura() {
  test('Test set CalculationMethod preset to Majlis Ugama Islam Singapura.', () {
    final CalculationMethod method =
        CalculationMethod.fromPreset(preset: CalculationMethodPreset.majlisUgamaIslamSingapura, when: DateTime.now().toUtc());

    expect(method.preset, equals(CalculationMethodPreset.majlisUgamaIslamSingapura));
    expect(method.fajrParameter.value, equals(20.0));
    expect(method.fajrParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type, equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(18.0));
    expect(method.ishaParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetDepartmentOfIslamicAdvancementOfMalaysia() {
  test('Test set CalculationMethod preset to Department of Islamic Advancement, Malaysia..', () {
    final CalculationMethod method =
        CalculationMethod.fromPreset(preset: CalculationMethodPreset.departmentOfIslamicAdvancementOfMalaysia, when: DateTime.now().toUtc());

    expect(method.preset, equals(CalculationMethodPreset.departmentOfIslamicAdvancementOfMalaysia));
    expect(method.fajrParameter.value, equals(20.0));
    expect(method.fajrParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.0));
    expect(method.maghribParameter.type, equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(18.0));
    expect(method.ishaParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.midnight, equals(Midnight.standard));
  });
}

void _testSetPresetUmmAlQuraUniversityDateError() {
  test('Test set CalculationMethod preset to Ummul Qura with non-UTC date should throw error.', () {
    expect(() {
      CalculationMethod.fromPreset(preset: CalculationMethodPreset.ummAlQuraUniversity, when: DateTime(2004, 2, 22));
    }, throwsA(const TypeMatcher<ArgumentError>()));
  });
}

void _testInvalidPresetError() {
  test('Test set CalculationMethod to invalid preset should throw error.', () {
    expect(() {
      CalculationMethod.fromPreset(preset: CalculationMethodPreset.custom, when: DateTime(2004, 2, 22));
    }, throwsA(const TypeMatcher<UnsupportedError>()));
  });
}

void _testSetCustomParameter() {
  test('Test set CalculationMethod using custom calculation parameter.', () {
    final CalculationMethod method = CalculationMethod.custom(
        fajrAngleParameter: 13.0,
        maghribParameter: 0.5,
        maghribParameterType: PrayerCalculationParameterType.minutesAdjust,
        ishaParameter: 13.5,
        ishaParameterType: PrayerCalculationParameterType.angle,
        midnight: Midnight.standard);

    expect(method.preset, equals(CalculationMethodPreset.custom));
    expect(method.fajrParameter.value, equals(13.0));
    expect(method.fajrParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.maghribParameter.value, equals(0.5));
    expect(method.maghribParameter.type, equals(PrayerCalculationParameterType.minutesAdjust));
    expect(method.ishaParameter.value, equals(13.5));
    expect(method.ishaParameter.type, equals(PrayerCalculationParameterType.angle));
    expect(method.midnight, equals(Midnight.standard));
  });
}
