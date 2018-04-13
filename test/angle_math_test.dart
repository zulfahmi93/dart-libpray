import 'dart:math' as math;
import 'package:test/test.dart';
import 'package:libpray/src/maths/angle_math.dart';

void testAngleMath() {
  group('angle_math tests.', () {
    _testFixNegative420DegreesAngle();
    _testFixNegative150DegreesAngle();
    _testFixPositive150DegreesAngle();
    _testFixPositive450DegreesAngle();
    _testConvert90DegreesAngleToRadian();
    _testConvert180DegreesAngleToRadian();
    _testConvert270DegreesAngleToRadian();
    _testConvert360DegreesAngleToRadian();
    _testConvertPiOver2RadianAngleToDegree();
    _testConvertPiRadianAngleToDegree();
    _testConvert3PiOver2RadianAngleToDegree();
    _testConvert2PiRadianAngleToDegree();
    _testComputeCosineOf0Degree();
    _testComputeCosineOf90Degree();
    _testComputeCosineOf180Degree();
    _testComputeCosineOf270Degree();
    _testComputeInverseOfCosineOf0();
    _testComputeInverseOfCosineOf1();
    _testComputeInverseOfCosineOfNegative1();
    _testComputeSineOf0Degree();
    _testComputeSineOf90Degree();
    _testComputeSineOf180Degree();
    _testComputeSineOf270Degree();
    _testComputeInverseOfSineOf0();
    _testComputeInverseOfSineOf1();
    _testComputeInverseOfSineOfNegative1();
    _testComputeTangentOf0Degree();
    _testComputeTangentOf45Degree();
    _testComputeTangentOf90Degree();
    _testComputeInverseTangent2InDegreeOfY1AndX1();
    _testComputeInverseTangent2InDegreeOfY1AndXSqrt3();
    _testComputeInverseTangent2InDegreeOfYSqrt3AndX1();
    _testComputeInverseCotangentInDegreeOfY1AndX1();
    _testComputeInverseCotangentInDegreeOfY1AndXSqrt3();
    _testComputeInverseCotangentInDegreeOfYSqrt3AndX1();
  });
}

void _testFixNegative420DegreesAngle() {
  test('Test fix angle -420 to +300.', () {
    expect(fixDegreesAngle(-420.0), equals(300.0));
  });
}

void _testFixNegative150DegreesAngle() {
  test('Test fix angle -150 to +210.', () {
    expect(fixDegreesAngle(-150.0), equals(210.0));
  });
}

void _testFixPositive150DegreesAngle() {
  test('Test fix angle +150 should return same value.', () {
    expect(fixDegreesAngle(150.0), equals(150.0));
  });
}

void _testFixPositive450DegreesAngle() {
  test('Test fix angle +450 to +90.', () {
    expect(fixDegreesAngle(450.0), equals(90.0));
  });
}

void _testConvert90DegreesAngleToRadian() {
  test('Test convert 90 degrees angle to pi/2 radian.', () {
    expect((degreeToRadian(90.0) - (math.pi / 2.0)).abs(), lessThan(1e-12));
  });
}

void _testConvert180DegreesAngleToRadian() {
  test('Test convert 180 degrees angle to pi radian.', () {
    expect((degreeToRadian(180.0) - math.pi).abs(), lessThan(1e-12));
  });
}

void _testConvert270DegreesAngleToRadian() {
  test('Test convert 270 degrees angle to 3pi/2 radian.', () {
    expect((degreeToRadian(270.0) - (3.0 * math.pi / 2.0)).abs(), lessThan(1e-12));
  });
}

void _testConvert360DegreesAngleToRadian() {
  test('Test convert 360 degrees angle to 2pi radian.', () {
    expect((degreeToRadian(360.0) - (2 * math.pi)).abs(), lessThan(1e-12));
  });
}

void _testConvertPiOver2RadianAngleToDegree() {
  test('Test convert pi/2 radian angle to 90 degrees.', () {
    expect((radianToDegree(math.pi / 2) - 90.0).abs(), lessThan(1e-12));
  });
}

void _testConvertPiRadianAngleToDegree() {
  test('Test convert pi radian angle to 180 degrees.', () {
    expect((radianToDegree(math.pi) - 180.0).abs(), lessThan(1e-12));
  });
}

void _testConvert3PiOver2RadianAngleToDegree() {
  test('Test convert 3pi/2 radian angle to 270 degrees.', () {
    expect((radianToDegree(3 * math.pi / 2) - 270.0).abs(), lessThan(1e-12));
  });
}

void _testConvert2PiRadianAngleToDegree() {
  test('Test convert 2pi radian angle to 360 degrees.', () {
    expect((radianToDegree(2 * math.pi) - 360.0).abs(), lessThan(1e-12));
  });
}

void _testComputeCosineOf0Degree() {
  test('Test compute cos(0 degree) should equals 1.', () {
    expect((cosineOfDegree(0.0) - 1.0).abs(), lessThan(1e-12));
  });
}

void _testComputeCosineOf90Degree() {
  test('Test compute cos(90 degree) should equals 0.', () {
    expect((cosineOfDegree(90.0) - 0.0).abs(), lessThan(1e-12));
  });
}

void _testComputeCosineOf180Degree() {
  test('Test compute cos(180 degree) should equals -1.', () {
    expect((cosineOfDegree(180.0) - (-1.0)).abs(), lessThan(1e-12));
  });
}

void _testComputeCosineOf270Degree() {
  test('Test compute cos(270 degree) should equals 0.', () {
    expect((cosineOfDegree(270.0) - 0.0).abs(), lessThan(1e-12));
  });
}

void _testComputeInverseOfCosineOf0() {
  test('Test compute acos(0) should equals 90 degree.', () {
    expect((inverseCosineInDegree(0.0) - 90.0).abs(), lessThan(1e-12));
  });
}

void _testComputeInverseOfCosineOf1() {
  test('Test compute acos(1) should equals 0 degree.', () {
    expect((inverseCosineInDegree(1.0) - 0.0).abs(), lessThan(1e-12));
  });
}

void _testComputeInverseOfCosineOfNegative1() {
  test('Test compute acos(-1) should equals 180 degree.', () {
    expect((inverseCosineInDegree(-1.0) - 180.0).abs(), lessThan(1e-12));
  });
}

void _testComputeSineOf0Degree() {
  test('Test compute sin(0 degree) should equals 0.', () {
    expect((sineOfDegree(0.0) - 0.0).abs(), lessThan(1e-12));
  });
}

void _testComputeSineOf90Degree() {
  test('Test compute sin(90 degree) should equals 1.', () {
    expect((sineOfDegree(90.0) - 1.0).abs(), lessThan(1e-12));
  });
}

void _testComputeSineOf180Degree() {
  test('Test compute sin(180 degree) should equals 0.', () {
    expect((sineOfDegree(180.0) - 0.0).abs(), lessThan(1e-12));
  });
}

void _testComputeSineOf270Degree() {
  test('Test compute sin(270 degree) should equals -1.', () {
    expect((sineOfDegree(270.0) - (-1.0)).abs(), lessThan(1e-12));
  });
}

void _testComputeInverseOfSineOf0() {
  test('Test compute asin(0) should equals 0 degree.', () {
    expect((inverseSineInDegree(0.0) - 0.0).abs(), lessThan(1e-12));
  });
}

void _testComputeInverseOfSineOf1() {
  test('Test compute asin(1) should equals 90 degree.', () {
    expect((inverseSineInDegree(1.0) - 90.0).abs(), lessThan(1e-12));
  });
}

void _testComputeInverseOfSineOfNegative1() {
  test('Test compute asin(-1) should equals -90 degree.', () {
    expect((inverseSineInDegree(-1.0) - (-90.0)).abs(), lessThan(1e-12));
  });
}

void _testComputeTangentOf0Degree() {
  test('Test compute tan(0 degree) should equals 0.', () {
    expect((tangentOfDegree(0.0) - 0.0).abs(), lessThan(1e-12));
  });
}

void _testComputeTangentOf45Degree() {
  test('Test compute tan(45 degree) should equals 1.', () {
    expect((tangentOfDegree(45.0) - 1.0).abs(), lessThan(1e-12));
  });
}

void _testComputeTangentOf90Degree() {
  test('Test compute tan(90 degree) should equals infinity.', () {
    expect((tangentOfDegree(90.0) - 16331239353195370.0).abs(), lessThan(1e-12)); //16331239353195370.0 is max value that can be returned by tan func.
  });
}

void _testComputeInverseTangent2InDegreeOfY1AndX1() {
  test('Test compute atan2(1,1) should equals 45 degree.', () {
    expect((inverseTangent2InDegree(1.0, 1.0) - 45.0).abs(), lessThan(1e-12));
  });
}

void _testComputeInverseTangent2InDegreeOfY1AndXSqrt3() {
  test('Test compute atan2(1,sqrt(3)) should equals 30 degree.', () {
    expect((inverseTangent2InDegree(1.0, math.sqrt(3.0)) - 30.0).abs(), lessThan(1e-12));
  });
}

void _testComputeInverseTangent2InDegreeOfYSqrt3AndX1() {
  test('Test compute atan2(sqrt(3),1) should equals 60 degree.', () {
    expect((inverseTangent2InDegree(math.sqrt(3.0), 1.0) - 60.0).abs(), lessThan(1e-12));
  });
}

void _testComputeInverseCotangentInDegreeOfY1AndX1() {
  test('Test compute acot(1/1) should equals 45 degree.', () {
    expect((inverseCotangentInDegree(1.0 / 1.0) - 45.0).abs(), lessThan(1e-12));
  });
}

void _testComputeInverseCotangentInDegreeOfY1AndXSqrt3() {
  test('Test compute acot(1/sqrt(3)) should equals 60 degree.', () {
    expect((inverseCotangentInDegree(1.0 / math.sqrt(3.0)) - 60.0).abs(), lessThan(1e-12));
  });
}

void _testComputeInverseCotangentInDegreeOfYSqrt3AndX1() {
  test('Test compute acot(sqrt(3)/1) should equals 30 degree.', () {
    expect((inverseCotangentInDegree(math.sqrt(3.0) / 1.0) - 30.0).abs(), lessThan(1e-12));
  });
}
