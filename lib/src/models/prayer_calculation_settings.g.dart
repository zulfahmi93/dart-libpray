// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_calculation_settings.dart';

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

Serializer<PrayerCalculationSettings> _$prayerCalculationSettingsSerializer =
    new _$PrayerCalculationSettingsSerializer();

class _$PrayerCalculationSettingsSerializer
    implements StructuredSerializer<PrayerCalculationSettings> {
  @override
  final Iterable<Type> types = const [
    PrayerCalculationSettings,
    _$PrayerCalculationSettings
  ];
  @override
  final String wireName = 'PrayerCalculationSettings';

  @override
  Iterable serialize(Serializers serializers, PrayerCalculationSettings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'imsakParameter',
      serializers.serialize(object.imsakParameter,
          specifiedType: const FullType(PrayerCalculationParameter)),
      'calculationMethod',
      serializers.serialize(object.calculationMethod,
          specifiedType: const FullType(CalculationMethod)),
      'juristicMethod',
      serializers.serialize(object.juristicMethod,
          specifiedType: const FullType(JuristicMethod)),
      'highLatitudeAdjustment',
      serializers.serialize(object.highLatitudeAdjustment,
          specifiedType: const FullType(HighLatitudeAdjustment)),
      'imsakMinutesAdjustment',
      serializers.serialize(object.imsakMinutesAdjustment,
          specifiedType: const FullType(int)),
      'fajrMinutesAdjustment',
      serializers.serialize(object.fajrMinutesAdjustment,
          specifiedType: const FullType(int)),
      'sunriseMinutesAdjustment',
      serializers.serialize(object.sunriseMinutesAdjustment,
          specifiedType: const FullType(int)),
      'dhuhaMinutesAdjustment',
      serializers.serialize(object.dhuhaMinutesAdjustment,
          specifiedType: const FullType(int)),
      'dhuhrMinutesAdjustment',
      serializers.serialize(object.dhuhrMinutesAdjustment,
          specifiedType: const FullType(int)),
      'asrMinutesAdjustment',
      serializers.serialize(object.asrMinutesAdjustment,
          specifiedType: const FullType(int)),
      'maghribMinutesAdjustment',
      serializers.serialize(object.maghribMinutesAdjustment,
          specifiedType: const FullType(int)),
      'ishaMinutesAdjustment',
      serializers.serialize(object.ishaMinutesAdjustment,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  PrayerCalculationSettings deserialize(
      Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PrayerCalculationSettingsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'imsakParameter':
          result.imsakParameter.replace(serializers.deserialize(value,
                  specifiedType: const FullType(PrayerCalculationParameter))
              as PrayerCalculationParameter);
          break;
        case 'calculationMethod':
          result.calculationMethod.replace(serializers.deserialize(value,
                  specifiedType: const FullType(CalculationMethod))
              as CalculationMethod);
          break;
        case 'juristicMethod':
          result.juristicMethod.replace(serializers.deserialize(value,
              specifiedType: const FullType(JuristicMethod)) as JuristicMethod);
          break;
        case 'highLatitudeAdjustment':
          result.highLatitudeAdjustment = serializers.deserialize(value,
                  specifiedType: const FullType(HighLatitudeAdjustment))
              as HighLatitudeAdjustment;
          break;
        case 'imsakMinutesAdjustment':
          result.imsakMinutesAdjustment = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'fajrMinutesAdjustment':
          result.fajrMinutesAdjustment = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'sunriseMinutesAdjustment':
          result.sunriseMinutesAdjustment = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'dhuhaMinutesAdjustment':
          result.dhuhaMinutesAdjustment = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'dhuhrMinutesAdjustment':
          result.dhuhrMinutesAdjustment = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'asrMinutesAdjustment':
          result.asrMinutesAdjustment = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'maghribMinutesAdjustment':
          result.maghribMinutesAdjustment = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'ishaMinutesAdjustment':
          result.ishaMinutesAdjustment = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$PrayerCalculationSettings extends PrayerCalculationSettings {
  @override
  final PrayerCalculationParameter imsakParameter;
  @override
  final CalculationMethod calculationMethod;
  @override
  final JuristicMethod juristicMethod;
  @override
  final HighLatitudeAdjustment highLatitudeAdjustment;
  @override
  final int imsakMinutesAdjustment;
  @override
  final int fajrMinutesAdjustment;
  @override
  final int sunriseMinutesAdjustment;
  @override
  final int dhuhaMinutesAdjustment;
  @override
  final int dhuhrMinutesAdjustment;
  @override
  final int asrMinutesAdjustment;
  @override
  final int maghribMinutesAdjustment;
  @override
  final int ishaMinutesAdjustment;

  factory _$PrayerCalculationSettings(
          [void updates(PrayerCalculationSettingsBuilder b)]) =>
      (new PrayerCalculationSettingsBuilder()..update(updates)).build();

  _$PrayerCalculationSettings._(
      {this.imsakParameter,
      this.calculationMethod,
      this.juristicMethod,
      this.highLatitudeAdjustment,
      this.imsakMinutesAdjustment,
      this.fajrMinutesAdjustment,
      this.sunriseMinutesAdjustment,
      this.dhuhaMinutesAdjustment,
      this.dhuhrMinutesAdjustment,
      this.asrMinutesAdjustment,
      this.maghribMinutesAdjustment,
      this.ishaMinutesAdjustment})
      : super._() {
    if (imsakParameter == null)
      throw new BuiltValueNullFieldError(
          'PrayerCalculationSettings', 'imsakParameter');
    if (calculationMethod == null)
      throw new BuiltValueNullFieldError(
          'PrayerCalculationSettings', 'calculationMethod');
    if (juristicMethod == null)
      throw new BuiltValueNullFieldError(
          'PrayerCalculationSettings', 'juristicMethod');
    if (highLatitudeAdjustment == null)
      throw new BuiltValueNullFieldError(
          'PrayerCalculationSettings', 'highLatitudeAdjustment');
    if (imsakMinutesAdjustment == null)
      throw new BuiltValueNullFieldError(
          'PrayerCalculationSettings', 'imsakMinutesAdjustment');
    if (fajrMinutesAdjustment == null)
      throw new BuiltValueNullFieldError(
          'PrayerCalculationSettings', 'fajrMinutesAdjustment');
    if (sunriseMinutesAdjustment == null)
      throw new BuiltValueNullFieldError(
          'PrayerCalculationSettings', 'sunriseMinutesAdjustment');
    if (dhuhaMinutesAdjustment == null)
      throw new BuiltValueNullFieldError(
          'PrayerCalculationSettings', 'dhuhaMinutesAdjustment');
    if (dhuhrMinutesAdjustment == null)
      throw new BuiltValueNullFieldError(
          'PrayerCalculationSettings', 'dhuhrMinutesAdjustment');
    if (asrMinutesAdjustment == null)
      throw new BuiltValueNullFieldError(
          'PrayerCalculationSettings', 'asrMinutesAdjustment');
    if (maghribMinutesAdjustment == null)
      throw new BuiltValueNullFieldError(
          'PrayerCalculationSettings', 'maghribMinutesAdjustment');
    if (ishaMinutesAdjustment == null)
      throw new BuiltValueNullFieldError(
          'PrayerCalculationSettings', 'ishaMinutesAdjustment');
  }

  @override
  PrayerCalculationSettings rebuild(
          void updates(PrayerCalculationSettingsBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PrayerCalculationSettingsBuilder toBuilder() =>
      new PrayerCalculationSettingsBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! PrayerCalculationSettings) return false;
    return imsakParameter == other.imsakParameter &&
        calculationMethod == other.calculationMethod &&
        juristicMethod == other.juristicMethod &&
        highLatitudeAdjustment == other.highLatitudeAdjustment &&
        imsakMinutesAdjustment == other.imsakMinutesAdjustment &&
        fajrMinutesAdjustment == other.fajrMinutesAdjustment &&
        sunriseMinutesAdjustment == other.sunriseMinutesAdjustment &&
        dhuhaMinutesAdjustment == other.dhuhaMinutesAdjustment &&
        dhuhrMinutesAdjustment == other.dhuhrMinutesAdjustment &&
        asrMinutesAdjustment == other.asrMinutesAdjustment &&
        maghribMinutesAdjustment == other.maghribMinutesAdjustment &&
        ishaMinutesAdjustment == other.ishaMinutesAdjustment;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, imsakParameter.hashCode),
                                                calculationMethod.hashCode),
                                            juristicMethod.hashCode),
                                        highLatitudeAdjustment.hashCode),
                                    imsakMinutesAdjustment.hashCode),
                                fajrMinutesAdjustment.hashCode),
                            sunriseMinutesAdjustment.hashCode),
                        dhuhaMinutesAdjustment.hashCode),
                    dhuhrMinutesAdjustment.hashCode),
                asrMinutesAdjustment.hashCode),
            maghribMinutesAdjustment.hashCode),
        ishaMinutesAdjustment.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PrayerCalculationSettings')
          ..add('imsakParameter', imsakParameter)
          ..add('calculationMethod', calculationMethod)
          ..add('juristicMethod', juristicMethod)
          ..add('highLatitudeAdjustment', highLatitudeAdjustment)
          ..add('imsakMinutesAdjustment', imsakMinutesAdjustment)
          ..add('fajrMinutesAdjustment', fajrMinutesAdjustment)
          ..add('sunriseMinutesAdjustment', sunriseMinutesAdjustment)
          ..add('dhuhaMinutesAdjustment', dhuhaMinutesAdjustment)
          ..add('dhuhrMinutesAdjustment', dhuhrMinutesAdjustment)
          ..add('asrMinutesAdjustment', asrMinutesAdjustment)
          ..add('maghribMinutesAdjustment', maghribMinutesAdjustment)
          ..add('ishaMinutesAdjustment', ishaMinutesAdjustment))
        .toString();
  }
}

class PrayerCalculationSettingsBuilder
    implements
        Builder<PrayerCalculationSettings, PrayerCalculationSettingsBuilder> {
  _$PrayerCalculationSettings _$v;

  PrayerCalculationParameterBuilder _imsakParameter;
  PrayerCalculationParameterBuilder get imsakParameter =>
      _$this._imsakParameter ??= new PrayerCalculationParameterBuilder();
  set imsakParameter(PrayerCalculationParameterBuilder imsakParameter) =>
      _$this._imsakParameter = imsakParameter;

  CalculationMethodBuilder _calculationMethod;
  CalculationMethodBuilder get calculationMethod =>
      _$this._calculationMethod ??= new CalculationMethodBuilder();
  set calculationMethod(CalculationMethodBuilder calculationMethod) =>
      _$this._calculationMethod = calculationMethod;

  JuristicMethodBuilder _juristicMethod;
  JuristicMethodBuilder get juristicMethod =>
      _$this._juristicMethod ??= new JuristicMethodBuilder();
  set juristicMethod(JuristicMethodBuilder juristicMethod) =>
      _$this._juristicMethod = juristicMethod;

  HighLatitudeAdjustment _highLatitudeAdjustment;
  HighLatitudeAdjustment get highLatitudeAdjustment =>
      _$this._highLatitudeAdjustment;
  set highLatitudeAdjustment(HighLatitudeAdjustment highLatitudeAdjustment) =>
      _$this._highLatitudeAdjustment = highLatitudeAdjustment;

  int _imsakMinutesAdjustment;
  int get imsakMinutesAdjustment => _$this._imsakMinutesAdjustment;
  set imsakMinutesAdjustment(int imsakMinutesAdjustment) =>
      _$this._imsakMinutesAdjustment = imsakMinutesAdjustment;

  int _fajrMinutesAdjustment;
  int get fajrMinutesAdjustment => _$this._fajrMinutesAdjustment;
  set fajrMinutesAdjustment(int fajrMinutesAdjustment) =>
      _$this._fajrMinutesAdjustment = fajrMinutesAdjustment;

  int _sunriseMinutesAdjustment;
  int get sunriseMinutesAdjustment => _$this._sunriseMinutesAdjustment;
  set sunriseMinutesAdjustment(int sunriseMinutesAdjustment) =>
      _$this._sunriseMinutesAdjustment = sunriseMinutesAdjustment;

  int _dhuhaMinutesAdjustment;
  int get dhuhaMinutesAdjustment => _$this._dhuhaMinutesAdjustment;
  set dhuhaMinutesAdjustment(int dhuhaMinutesAdjustment) =>
      _$this._dhuhaMinutesAdjustment = dhuhaMinutesAdjustment;

  int _dhuhrMinutesAdjustment;
  int get dhuhrMinutesAdjustment => _$this._dhuhrMinutesAdjustment;
  set dhuhrMinutesAdjustment(int dhuhrMinutesAdjustment) =>
      _$this._dhuhrMinutesAdjustment = dhuhrMinutesAdjustment;

  int _asrMinutesAdjustment;
  int get asrMinutesAdjustment => _$this._asrMinutesAdjustment;
  set asrMinutesAdjustment(int asrMinutesAdjustment) =>
      _$this._asrMinutesAdjustment = asrMinutesAdjustment;

  int _maghribMinutesAdjustment;
  int get maghribMinutesAdjustment => _$this._maghribMinutesAdjustment;
  set maghribMinutesAdjustment(int maghribMinutesAdjustment) =>
      _$this._maghribMinutesAdjustment = maghribMinutesAdjustment;

  int _ishaMinutesAdjustment;
  int get ishaMinutesAdjustment => _$this._ishaMinutesAdjustment;
  set ishaMinutesAdjustment(int ishaMinutesAdjustment) =>
      _$this._ishaMinutesAdjustment = ishaMinutesAdjustment;

  PrayerCalculationSettingsBuilder();

  PrayerCalculationSettingsBuilder get _$this {
    if (_$v != null) {
      _imsakParameter = _$v.imsakParameter?.toBuilder();
      _calculationMethod = _$v.calculationMethod?.toBuilder();
      _juristicMethod = _$v.juristicMethod?.toBuilder();
      _highLatitudeAdjustment = _$v.highLatitudeAdjustment;
      _imsakMinutesAdjustment = _$v.imsakMinutesAdjustment;
      _fajrMinutesAdjustment = _$v.fajrMinutesAdjustment;
      _sunriseMinutesAdjustment = _$v.sunriseMinutesAdjustment;
      _dhuhaMinutesAdjustment = _$v.dhuhaMinutesAdjustment;
      _dhuhrMinutesAdjustment = _$v.dhuhrMinutesAdjustment;
      _asrMinutesAdjustment = _$v.asrMinutesAdjustment;
      _maghribMinutesAdjustment = _$v.maghribMinutesAdjustment;
      _ishaMinutesAdjustment = _$v.ishaMinutesAdjustment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PrayerCalculationSettings other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$PrayerCalculationSettings;
  }

  @override
  void update(void updates(PrayerCalculationSettingsBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$PrayerCalculationSettings build() {
    _$PrayerCalculationSettings _$result;
    try {
      _$result = _$v ??
          new _$PrayerCalculationSettings._(
              imsakParameter: imsakParameter.build(),
              calculationMethod: calculationMethod.build(),
              juristicMethod: juristicMethod.build(),
              highLatitudeAdjustment: highLatitudeAdjustment,
              imsakMinutesAdjustment: imsakMinutesAdjustment,
              fajrMinutesAdjustment: fajrMinutesAdjustment,
              sunriseMinutesAdjustment: sunriseMinutesAdjustment,
              dhuhaMinutesAdjustment: dhuhaMinutesAdjustment,
              dhuhrMinutesAdjustment: dhuhrMinutesAdjustment,
              asrMinutesAdjustment: asrMinutesAdjustment,
              maghribMinutesAdjustment: maghribMinutesAdjustment,
              ishaMinutesAdjustment: ishaMinutesAdjustment);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'imsakParameter';
        imsakParameter.build();
        _$failedField = 'calculationMethod';
        calculationMethod.build();
        _$failedField = 'juristicMethod';
        juristicMethod.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PrayerCalculationSettings', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
