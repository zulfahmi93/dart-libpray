// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'high_latitude_adjustment.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

const HighLatitudeAdjustment _$none = const HighLatitudeAdjustment._('none');
const HighLatitudeAdjustment _$middleOfNight =
    const HighLatitudeAdjustment._('middleOfNight');
const HighLatitudeAdjustment _$oneSeventhOfNight =
    const HighLatitudeAdjustment._('oneSeventhOfNight');
const HighLatitudeAdjustment _$angleBased =
    const HighLatitudeAdjustment._('angleBased');

HighLatitudeAdjustment _$valueOf(String name) {
  switch (name) {
    case 'none':
      return _$none;
    case 'middleOfNight':
      return _$middleOfNight;
    case 'oneSeventhOfNight':
      return _$oneSeventhOfNight;
    case 'angleBased':
      return _$angleBased;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<HighLatitudeAdjustment> _$values =
    new BuiltSet<HighLatitudeAdjustment>(const <HighLatitudeAdjustment>[
  _$none,
  _$middleOfNight,
  _$oneSeventhOfNight,
  _$angleBased,
]);

Serializer<HighLatitudeAdjustment> _$highLatitudeAdjustmentSerializer =
    new _$HighLatitudeAdjustmentSerializer();

class _$HighLatitudeAdjustmentSerializer
    implements PrimitiveSerializer<HighLatitudeAdjustment> {
  @override
  final Iterable<Type> types = const <Type>[HighLatitudeAdjustment];
  @override
  final String wireName = 'HighLatitudeAdjustment';

  @override
  Object serialize(Serializers serializers, HighLatitudeAdjustment object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  HighLatitudeAdjustment deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      HighLatitudeAdjustment.valueOf(serialized as String);
}
