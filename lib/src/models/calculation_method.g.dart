// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculation_method.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PrayerCalculationParameterType _$minutesAdjust =
    const PrayerCalculationParameterType._('minutesAdjust');
const PrayerCalculationParameterType _$angle =
    const PrayerCalculationParameterType._('angle');

PrayerCalculationParameterType _$valueOfPCPT(String name) {
  switch (name) {
    case 'minutesAdjust':
      return _$minutesAdjust;
    case 'angle':
      return _$angle;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<PrayerCalculationParameterType> _$valuesPCPT = new BuiltSet<
    PrayerCalculationParameterType>(const <PrayerCalculationParameterType>[
  _$minutesAdjust,
  _$angle,
]);

const CalculationMethodPreset _$custom =
    const CalculationMethodPreset._('custom');
const CalculationMethodPreset _$ithnaAshari =
    const CalculationMethodPreset._('ithnaAshari');
const CalculationMethodPreset _$universityOfIslamicSciencesKarachi =
    const CalculationMethodPreset._('universityOfIslamicSciencesKarachi');
const CalculationMethodPreset _$islamicSocietyOfNorthAmerica =
    const CalculationMethodPreset._('islamicSocietyOfNorthAmerica');
const CalculationMethodPreset _$muslimWorldLeague =
    const CalculationMethodPreset._('muslimWorldLeague');
const CalculationMethodPreset _$ummAlQuraUniversity =
    const CalculationMethodPreset._('ummAlQuraUniversity');
const CalculationMethodPreset _$egyptianGeneralAuthorityOfSurvey =
    const CalculationMethodPreset._('egyptianGeneralAuthorityOfSurvey');
const CalculationMethodPreset _$instituteOfGeophysicsUniversityOfTehran =
    const CalculationMethodPreset._('instituteOfGeophysicsUniversityOfTehran');
const CalculationMethodPreset _$unionDesOrganisationsIslamiquesDeFrance =
    const CalculationMethodPreset._('unionDesOrganisationsIslamiquesDeFrance');
const CalculationMethodPreset _$majlisUgamaIslamSingapura =
    const CalculationMethodPreset._('majlisUgamaIslamSingapura');
const CalculationMethodPreset _$departmentOfIslamicAdvancementOfMalaysia =
    const CalculationMethodPreset._('departmentOfIslamicAdvancementOfMalaysia');

CalculationMethodPreset _$valueOf(String name) {
  switch (name) {
    case 'custom':
      return _$custom;
    case 'ithnaAshari':
      return _$ithnaAshari;
    case 'universityOfIslamicSciencesKarachi':
      return _$universityOfIslamicSciencesKarachi;
    case 'islamicSocietyOfNorthAmerica':
      return _$islamicSocietyOfNorthAmerica;
    case 'muslimWorldLeague':
      return _$muslimWorldLeague;
    case 'ummAlQuraUniversity':
      return _$ummAlQuraUniversity;
    case 'egyptianGeneralAuthorityOfSurvey':
      return _$egyptianGeneralAuthorityOfSurvey;
    case 'instituteOfGeophysicsUniversityOfTehran':
      return _$instituteOfGeophysicsUniversityOfTehran;
    case 'unionDesOrganisationsIslamiquesDeFrance':
      return _$unionDesOrganisationsIslamiquesDeFrance;
    case 'majlisUgamaIslamSingapura':
      return _$majlisUgamaIslamSingapura;
    case 'departmentOfIslamicAdvancementOfMalaysia':
      return _$departmentOfIslamicAdvancementOfMalaysia;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CalculationMethodPreset> _$values =
    new BuiltSet<CalculationMethodPreset>(const <CalculationMethodPreset>[
  _$custom,
  _$ithnaAshari,
  _$universityOfIslamicSciencesKarachi,
  _$islamicSocietyOfNorthAmerica,
  _$muslimWorldLeague,
  _$ummAlQuraUniversity,
  _$egyptianGeneralAuthorityOfSurvey,
  _$instituteOfGeophysicsUniversityOfTehran,
  _$unionDesOrganisationsIslamiquesDeFrance,
  _$majlisUgamaIslamSingapura,
  _$departmentOfIslamicAdvancementOfMalaysia,
]);

const Midnight _$standard = const Midnight._('standard');
const Midnight _$jafari = const Midnight._('jafari');

Midnight _$valueOfM(String name) {
  switch (name) {
    case 'standard':
      return _$standard;
    case 'jafari':
      return _$jafari;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<Midnight> _$valuesM = new BuiltSet<Midnight>(const <Midnight>[
  _$standard,
  _$jafari,
]);

Serializer<CalculationMethod> _$calculationMethodSerializer =
    new _$CalculationMethodSerializer();
Serializer<PrayerCalculationParameterType>
    _$prayerCalculationParameterTypeSerializer =
    new _$PrayerCalculationParameterTypeSerializer();
Serializer<PrayerCalculationParameter> _$prayerCalculationParameterSerializer =
    new _$PrayerCalculationParameterSerializer();
Serializer<CalculationMethodPreset> _$calculationMethodPresetSerializer =
    new _$CalculationMethodPresetSerializer();
Serializer<Midnight> _$midnightSerializer = new _$MidnightSerializer();

class _$CalculationMethodSerializer
    implements StructuredSerializer<CalculationMethod> {
  @override
  final Iterable<Type> types = const [CalculationMethod, _$CalculationMethod];
  @override
  final String wireName = 'CalculationMethod';

  @override
  Iterable<Object> serialize(Serializers serializers, CalculationMethod object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'preset',
      serializers.serialize(object.preset,
          specifiedType: const FullType(CalculationMethodPreset)),
      'fajrParameter',
      serializers.serialize(object.fajrParameter,
          specifiedType: const FullType(PrayerCalculationParameter)),
      'maghribParameter',
      serializers.serialize(object.maghribParameter,
          specifiedType: const FullType(PrayerCalculationParameter)),
      'ishaParameter',
      serializers.serialize(object.ishaParameter,
          specifiedType: const FullType(PrayerCalculationParameter)),
      'midnight',
      serializers.serialize(object.midnight,
          specifiedType: const FullType(Midnight)),
    ];

    return result;
  }

  @override
  CalculationMethod deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CalculationMethodBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'preset':
          result.preset = serializers.deserialize(value,
                  specifiedType: const FullType(CalculationMethodPreset))
              as CalculationMethodPreset;
          break;
        case 'fajrParameter':
          result.fajrParameter.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PrayerCalculationParameter))
              as PrayerCalculationParameter);
          break;
        case 'maghribParameter':
          result.maghribParameter.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PrayerCalculationParameter))
              as PrayerCalculationParameter);
          break;
        case 'ishaParameter':
          result.ishaParameter.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PrayerCalculationParameter))
              as PrayerCalculationParameter);
          break;
        case 'midnight':
          result.midnight = serializers.deserialize(value,
              specifiedType: const FullType(Midnight)) as Midnight;
          break;
      }
    }

    return result.build();
  }
}

class _$PrayerCalculationParameterTypeSerializer
    implements PrimitiveSerializer<PrayerCalculationParameterType> {
  @override
  final Iterable<Type> types = const <Type>[PrayerCalculationParameterType];
  @override
  final String wireName = 'PrayerCalculationParameterType';

  @override
  Object serialize(
          Serializers serializers, PrayerCalculationParameterType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  PrayerCalculationParameterType deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PrayerCalculationParameterType.valueOf(serialized as String);
}

class _$PrayerCalculationParameterSerializer
    implements StructuredSerializer<PrayerCalculationParameter> {
  @override
  final Iterable<Type> types = const [
    PrayerCalculationParameter,
    _$PrayerCalculationParameter
  ];
  @override
  final String wireName = 'PrayerCalculationParameter';

  @override
  Iterable<Object> serialize(
      Serializers serializers, PrayerCalculationParameter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.type != null) {
      result
        ..add('type')
        ..add(serializers.serialize(object.type,
            specifiedType: const FullType(PrayerCalculationParameterType)));
    }
    if (object.value != null) {
      result
        ..add('value')
        ..add(serializers.serialize(object.value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  PrayerCalculationParameter deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PrayerCalculationParameterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(PrayerCalculationParameterType))
              as PrayerCalculationParameterType;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$CalculationMethodPresetSerializer
    implements PrimitiveSerializer<CalculationMethodPreset> {
  @override
  final Iterable<Type> types = const <Type>[CalculationMethodPreset];
  @override
  final String wireName = 'CalculationMethodPreset';

  @override
  Object serialize(Serializers serializers, CalculationMethodPreset object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  CalculationMethodPreset deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CalculationMethodPreset.valueOf(serialized as String);
}

class _$MidnightSerializer implements PrimitiveSerializer<Midnight> {
  @override
  final Iterable<Type> types = const <Type>[Midnight];
  @override
  final String wireName = 'Midnight';

  @override
  Object serialize(Serializers serializers, Midnight object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  Midnight deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      Midnight.valueOf(serialized as String);
}

class _$CalculationMethod extends CalculationMethod {
  @override
  final CalculationMethodPreset preset;
  @override
  final PrayerCalculationParameter fajrParameter;
  @override
  final PrayerCalculationParameter maghribParameter;
  @override
  final PrayerCalculationParameter ishaParameter;
  @override
  final Midnight midnight;

  factory _$CalculationMethod(
          [void Function(CalculationMethodBuilder) updates]) =>
      (new CalculationMethodBuilder()..update(updates)).build();

  _$CalculationMethod._(
      {this.preset,
      this.fajrParameter,
      this.maghribParameter,
      this.ishaParameter,
      this.midnight})
      : super._() {
    if (preset == null) {
      throw new BuiltValueNullFieldError('CalculationMethod', 'preset');
    }
    if (fajrParameter == null) {
      throw new BuiltValueNullFieldError('CalculationMethod', 'fajrParameter');
    }
    if (maghribParameter == null) {
      throw new BuiltValueNullFieldError(
          'CalculationMethod', 'maghribParameter');
    }
    if (ishaParameter == null) {
      throw new BuiltValueNullFieldError('CalculationMethod', 'ishaParameter');
    }
    if (midnight == null) {
      throw new BuiltValueNullFieldError('CalculationMethod', 'midnight');
    }
  }

  @override
  CalculationMethod rebuild(void Function(CalculationMethodBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CalculationMethodBuilder toBuilder() =>
      new CalculationMethodBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CalculationMethod &&
        preset == other.preset &&
        fajrParameter == other.fajrParameter &&
        maghribParameter == other.maghribParameter &&
        ishaParameter == other.ishaParameter &&
        midnight == other.midnight;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, preset.hashCode), fajrParameter.hashCode),
                maghribParameter.hashCode),
            ishaParameter.hashCode),
        midnight.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CalculationMethod')
          ..add('preset', preset)
          ..add('fajrParameter', fajrParameter)
          ..add('maghribParameter', maghribParameter)
          ..add('ishaParameter', ishaParameter)
          ..add('midnight', midnight))
        .toString();
  }
}

class CalculationMethodBuilder
    implements Builder<CalculationMethod, CalculationMethodBuilder> {
  _$CalculationMethod _$v;

  CalculationMethodPreset _preset;
  CalculationMethodPreset get preset => _$this._preset;
  set preset(CalculationMethodPreset preset) => _$this._preset = preset;

  PrayerCalculationParameterBuilder _fajrParameter;
  PrayerCalculationParameterBuilder get fajrParameter =>
      _$this._fajrParameter ??= new PrayerCalculationParameterBuilder();
  set fajrParameter(PrayerCalculationParameterBuilder fajrParameter) =>
      _$this._fajrParameter = fajrParameter;

  PrayerCalculationParameterBuilder _maghribParameter;
  PrayerCalculationParameterBuilder get maghribParameter =>
      _$this._maghribParameter ??= new PrayerCalculationParameterBuilder();
  set maghribParameter(PrayerCalculationParameterBuilder maghribParameter) =>
      _$this._maghribParameter = maghribParameter;

  PrayerCalculationParameterBuilder _ishaParameter;
  PrayerCalculationParameterBuilder get ishaParameter =>
      _$this._ishaParameter ??= new PrayerCalculationParameterBuilder();
  set ishaParameter(PrayerCalculationParameterBuilder ishaParameter) =>
      _$this._ishaParameter = ishaParameter;

  Midnight _midnight;
  Midnight get midnight => _$this._midnight;
  set midnight(Midnight midnight) => _$this._midnight = midnight;

  CalculationMethodBuilder();

  CalculationMethodBuilder get _$this {
    if (_$v != null) {
      _preset = _$v.preset;
      _fajrParameter = _$v.fajrParameter?.toBuilder();
      _maghribParameter = _$v.maghribParameter?.toBuilder();
      _ishaParameter = _$v.ishaParameter?.toBuilder();
      _midnight = _$v.midnight;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CalculationMethod other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CalculationMethod;
  }

  @override
  void update(void Function(CalculationMethodBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CalculationMethod build() {
    _$CalculationMethod _$result;
    try {
      _$result = _$v ??
          new _$CalculationMethod._(
              preset: preset,
              fajrParameter: fajrParameter.build(),
              maghribParameter: maghribParameter.build(),
              ishaParameter: ishaParameter.build(),
              midnight: midnight);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'fajrParameter';
        fajrParameter.build();
        _$failedField = 'maghribParameter';
        maghribParameter.build();
        _$failedField = 'ishaParameter';
        ishaParameter.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CalculationMethod', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PrayerCalculationParameter extends PrayerCalculationParameter {
  @override
  final PrayerCalculationParameterType type;
  @override
  final double value;

  factory _$PrayerCalculationParameter(
          [void Function(PrayerCalculationParameterBuilder) updates]) =>
      (new PrayerCalculationParameterBuilder()..update(updates)).build();

  _$PrayerCalculationParameter._({this.type, this.value}) : super._();

  @override
  PrayerCalculationParameter rebuild(
          void Function(PrayerCalculationParameterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PrayerCalculationParameterBuilder toBuilder() =>
      new PrayerCalculationParameterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PrayerCalculationParameter &&
        type == other.type &&
        value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, type.hashCode), value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PrayerCalculationParameter')
          ..add('type', type)
          ..add('value', value))
        .toString();
  }
}

class PrayerCalculationParameterBuilder
    implements
        Builder<PrayerCalculationParameter, PrayerCalculationParameterBuilder> {
  _$PrayerCalculationParameter _$v;

  PrayerCalculationParameterType _type;
  PrayerCalculationParameterType get type => _$this._type;
  set type(PrayerCalculationParameterType type) => _$this._type = type;

  double _value;
  double get value => _$this._value;
  set value(double value) => _$this._value = value;

  PrayerCalculationParameterBuilder();

  PrayerCalculationParameterBuilder get _$this {
    if (_$v != null) {
      _type = _$v.type;
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PrayerCalculationParameter other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PrayerCalculationParameter;
  }

  @override
  void update(void Function(PrayerCalculationParameterBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PrayerCalculationParameter build() {
    final _$result =
        _$v ?? new _$PrayerCalculationParameter._(type: type, value: value);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
