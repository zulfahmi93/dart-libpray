import 'package:libpray/libpray.dart';
import 'package:test/test.dart';

void testJuristicMethod() {
  group('juristic_method.dart tests.', () {
    _testSetPresetStandard();
    _testSetPresetHanafi();
  });
}

void _testSetPresetStandard() {
  test('Test set JuristicMethod preset to Ithna Ashari.', () {
    final JuristicMethod method = JuristicMethod.fromPreset(preset: JuristicMethodPreset.standard);

    expect(method.preset, equals(JuristicMethodPreset.standard));
    expect(method.timeOfShadow, equals(1));
  });
}

void _testSetPresetHanafi() {
  test('Test set JuristicMethod preset to Hanafi.', () {
    final JuristicMethod method = JuristicMethod.fromPreset(preset: JuristicMethodPreset.hanafi);

    expect(method.preset, equals(JuristicMethodPreset.hanafi));
    expect(method.timeOfShadow, equals(2));
  });
}
