// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'juristic_method.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const JuristicMethodPreset _$standard =
    const JuristicMethodPreset._('standard');
const JuristicMethodPreset _$hanafi = const JuristicMethodPreset._('hanafi');

JuristicMethodPreset _$valueOf(String name) {
  switch (name) {
    case 'standard':
      return _$standard;
    case 'hanafi':
      return _$hanafi;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<JuristicMethodPreset> _$values =
    new BuiltSet<JuristicMethodPreset>(const <JuristicMethodPreset>[
  _$standard,
  _$hanafi,
]);

Serializer<JuristicMethod> _$juristicMethodSerializer =
    new _$JuristicMethodSerializer();
Serializer<JuristicMethodPreset> _$juristicMethodPresetSerializer =
    new _$JuristicMethodPresetSerializer();

class _$JuristicMethodSerializer
    implements StructuredSerializer<JuristicMethod> {
  @override
  final Iterable<Type> types = const [JuristicMethod, _$JuristicMethod];
  @override
  final String wireName = 'JuristicMethod';

  @override
  Iterable<Object> serialize(Serializers serializers, JuristicMethod object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'preset',
      serializers.serialize(object.preset,
          specifiedType: const FullType(JuristicMethodPreset)),
      'timeOfShadow',
      serializers.serialize(object.timeOfShadow,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  JuristicMethod deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new JuristicMethodBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'preset':
          result.preset = serializers.deserialize(value,
                  specifiedType: const FullType(JuristicMethodPreset))
              as JuristicMethodPreset;
          break;
        case 'timeOfShadow':
          result.timeOfShadow = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$JuristicMethodPresetSerializer
    implements PrimitiveSerializer<JuristicMethodPreset> {
  @override
  final Iterable<Type> types = const <Type>[JuristicMethodPreset];
  @override
  final String wireName = 'JuristicMethodPreset';

  @override
  Object serialize(Serializers serializers, JuristicMethodPreset object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  JuristicMethodPreset deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      JuristicMethodPreset.valueOf(serialized as String);
}

class _$JuristicMethod extends JuristicMethod {
  @override
  final JuristicMethodPreset preset;
  @override
  final int timeOfShadow;

  factory _$JuristicMethod([void Function(JuristicMethodBuilder) updates]) =>
      (new JuristicMethodBuilder()..update(updates)).build();

  _$JuristicMethod._({this.preset, this.timeOfShadow}) : super._() {
    if (preset == null) {
      throw new BuiltValueNullFieldError('JuristicMethod', 'preset');
    }
    if (timeOfShadow == null) {
      throw new BuiltValueNullFieldError('JuristicMethod', 'timeOfShadow');
    }
  }

  @override
  JuristicMethod rebuild(void Function(JuristicMethodBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JuristicMethodBuilder toBuilder() =>
      new JuristicMethodBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JuristicMethod &&
        preset == other.preset &&
        timeOfShadow == other.timeOfShadow;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, preset.hashCode), timeOfShadow.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('JuristicMethod')
          ..add('preset', preset)
          ..add('timeOfShadow', timeOfShadow))
        .toString();
  }
}

class JuristicMethodBuilder
    implements Builder<JuristicMethod, JuristicMethodBuilder> {
  _$JuristicMethod _$v;

  JuristicMethodPreset _preset;
  JuristicMethodPreset get preset => _$this._preset;
  set preset(JuristicMethodPreset preset) => _$this._preset = preset;

  int _timeOfShadow;
  int get timeOfShadow => _$this._timeOfShadow;
  set timeOfShadow(int timeOfShadow) => _$this._timeOfShadow = timeOfShadow;

  JuristicMethodBuilder();

  JuristicMethodBuilder get _$this {
    if (_$v != null) {
      _preset = _$v.preset;
      _timeOfShadow = _$v.timeOfShadow;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JuristicMethod other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$JuristicMethod;
  }

  @override
  void update(void Function(JuristicMethodBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$JuristicMethod build() {
    final _$result = _$v ??
        new _$JuristicMethod._(preset: preset, timeOfShadow: timeOfShadow);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
