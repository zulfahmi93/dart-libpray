// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PrayerType _$imsak = const PrayerType._('imsak');
const PrayerType _$fajr = const PrayerType._('fajr');
const PrayerType _$sunrise = const PrayerType._('sunrise');
const PrayerType _$dhuha = const PrayerType._('dhuha');
const PrayerType _$dhuhr = const PrayerType._('dhuhr');
const PrayerType _$asr = const PrayerType._('asr');
const PrayerType _$maghrib = const PrayerType._('maghrib');
const PrayerType _$isha = const PrayerType._('isha');

PrayerType _$valueOf(String name) {
  switch (name) {
    case 'imsak':
      return _$imsak;
    case 'fajr':
      return _$fajr;
    case 'sunrise':
      return _$sunrise;
    case 'dhuha':
      return _$dhuha;
    case 'dhuhr':
      return _$dhuhr;
    case 'asr':
      return _$asr;
    case 'maghrib':
      return _$maghrib;
    case 'isha':
      return _$isha;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<PrayerType> _$values =
    new BuiltSet<PrayerType>(const <PrayerType>[
  _$imsak,
  _$fajr,
  _$sunrise,
  _$dhuha,
  _$dhuhr,
  _$asr,
  _$maghrib,
  _$isha,
]);

Serializer<Prayers> _$prayersSerializer = new _$PrayersSerializer();
Serializer<Prayer> _$prayerSerializer = new _$PrayerSerializer();
Serializer<PrayerType> _$prayerTypeSerializer = new _$PrayerTypeSerializer();

class _$PrayersSerializer implements StructuredSerializer<Prayers> {
  @override
  final Iterable<Type> types = const [Prayers, _$Prayers];
  @override
  final String wireName = 'Prayers';

  @override
  Iterable<Object> serialize(Serializers serializers, Prayers object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'imsak',
      serializers.serialize(object.imsak,
          specifiedType: const FullType(DateTime)),
      'fajr',
      serializers.serialize(object.fajr,
          specifiedType: const FullType(DateTime)),
      'sunrise',
      serializers.serialize(object.sunrise,
          specifiedType: const FullType(DateTime)),
      'dhuha',
      serializers.serialize(object.dhuha,
          specifiedType: const FullType(DateTime)),
      'dhuhr',
      serializers.serialize(object.dhuhr,
          specifiedType: const FullType(DateTime)),
      'asr',
      serializers.serialize(object.asr,
          specifiedType: const FullType(DateTime)),
      'sunset',
      serializers.serialize(object.sunset,
          specifiedType: const FullType(DateTime)),
      'maghrib',
      serializers.serialize(object.maghrib,
          specifiedType: const FullType(DateTime)),
      'isha',
      serializers.serialize(object.isha,
          specifiedType: const FullType(DateTime)),
      'midnight',
      serializers.serialize(object.midnight,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  Prayers deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PrayersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'imsak':
          result.imsak = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'fajr':
          result.fajr = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'sunrise':
          result.sunrise = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'dhuha':
          result.dhuha = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'dhuhr':
          result.dhuhr = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'asr':
          result.asr = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'sunset':
          result.sunset = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'maghrib':
          result.maghrib = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'isha':
          result.isha = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'midnight':
          result.midnight = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$PrayerSerializer implements StructuredSerializer<Prayer> {
  @override
  final Iterable<Type> types = const [Prayer, _$Prayer];
  @override
  final String wireName = 'Prayer';

  @override
  Iterable<Object> serialize(Serializers serializers, Prayer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(PrayerType)),
      'time',
      serializers.serialize(object.time,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  Prayer deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PrayerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(PrayerType)) as PrayerType;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$PrayerTypeSerializer implements PrimitiveSerializer<PrayerType> {
  @override
  final Iterable<Type> types = const <Type>[PrayerType];
  @override
  final String wireName = 'PrayerType';

  @override
  Object serialize(Serializers serializers, PrayerType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  PrayerType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PrayerType.valueOf(serialized as String);
}

class _$Prayers extends Prayers {
  @override
  final DateTime imsak;
  @override
  final DateTime fajr;
  @override
  final DateTime sunrise;
  @override
  final DateTime dhuha;
  @override
  final DateTime dhuhr;
  @override
  final DateTime asr;
  @override
  final DateTime sunset;
  @override
  final DateTime maghrib;
  @override
  final DateTime isha;
  @override
  final DateTime midnight;

  factory _$Prayers([void Function(PrayersBuilder) updates]) =>
      (new PrayersBuilder()..update(updates)).build();

  _$Prayers._(
      {this.imsak,
      this.fajr,
      this.sunrise,
      this.dhuha,
      this.dhuhr,
      this.asr,
      this.sunset,
      this.maghrib,
      this.isha,
      this.midnight})
      : super._() {
    if (imsak == null) {
      throw new BuiltValueNullFieldError('Prayers', 'imsak');
    }
    if (fajr == null) {
      throw new BuiltValueNullFieldError('Prayers', 'fajr');
    }
    if (sunrise == null) {
      throw new BuiltValueNullFieldError('Prayers', 'sunrise');
    }
    if (dhuha == null) {
      throw new BuiltValueNullFieldError('Prayers', 'dhuha');
    }
    if (dhuhr == null) {
      throw new BuiltValueNullFieldError('Prayers', 'dhuhr');
    }
    if (asr == null) {
      throw new BuiltValueNullFieldError('Prayers', 'asr');
    }
    if (sunset == null) {
      throw new BuiltValueNullFieldError('Prayers', 'sunset');
    }
    if (maghrib == null) {
      throw new BuiltValueNullFieldError('Prayers', 'maghrib');
    }
    if (isha == null) {
      throw new BuiltValueNullFieldError('Prayers', 'isha');
    }
    if (midnight == null) {
      throw new BuiltValueNullFieldError('Prayers', 'midnight');
    }
  }

  @override
  Prayers rebuild(void Function(PrayersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PrayersBuilder toBuilder() => new PrayersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Prayers &&
        imsak == other.imsak &&
        fajr == other.fajr &&
        sunrise == other.sunrise &&
        dhuha == other.dhuha &&
        dhuhr == other.dhuhr &&
        asr == other.asr &&
        sunset == other.sunset &&
        maghrib == other.maghrib &&
        isha == other.isha &&
        midnight == other.midnight;
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
                                $jc($jc($jc(0, imsak.hashCode), fajr.hashCode),
                                    sunrise.hashCode),
                                dhuha.hashCode),
                            dhuhr.hashCode),
                        asr.hashCode),
                    sunset.hashCode),
                maghrib.hashCode),
            isha.hashCode),
        midnight.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Prayers')
          ..add('imsak', imsak)
          ..add('fajr', fajr)
          ..add('sunrise', sunrise)
          ..add('dhuha', dhuha)
          ..add('dhuhr', dhuhr)
          ..add('asr', asr)
          ..add('sunset', sunset)
          ..add('maghrib', maghrib)
          ..add('isha', isha)
          ..add('midnight', midnight))
        .toString();
  }
}

class PrayersBuilder implements Builder<Prayers, PrayersBuilder> {
  _$Prayers _$v;

  DateTime _imsak;
  DateTime get imsak => _$this._imsak;
  set imsak(DateTime imsak) => _$this._imsak = imsak;

  DateTime _fajr;
  DateTime get fajr => _$this._fajr;
  set fajr(DateTime fajr) => _$this._fajr = fajr;

  DateTime _sunrise;
  DateTime get sunrise => _$this._sunrise;
  set sunrise(DateTime sunrise) => _$this._sunrise = sunrise;

  DateTime _dhuha;
  DateTime get dhuha => _$this._dhuha;
  set dhuha(DateTime dhuha) => _$this._dhuha = dhuha;

  DateTime _dhuhr;
  DateTime get dhuhr => _$this._dhuhr;
  set dhuhr(DateTime dhuhr) => _$this._dhuhr = dhuhr;

  DateTime _asr;
  DateTime get asr => _$this._asr;
  set asr(DateTime asr) => _$this._asr = asr;

  DateTime _sunset;
  DateTime get sunset => _$this._sunset;
  set sunset(DateTime sunset) => _$this._sunset = sunset;

  DateTime _maghrib;
  DateTime get maghrib => _$this._maghrib;
  set maghrib(DateTime maghrib) => _$this._maghrib = maghrib;

  DateTime _isha;
  DateTime get isha => _$this._isha;
  set isha(DateTime isha) => _$this._isha = isha;

  DateTime _midnight;
  DateTime get midnight => _$this._midnight;
  set midnight(DateTime midnight) => _$this._midnight = midnight;

  PrayersBuilder();

  PrayersBuilder get _$this {
    if (_$v != null) {
      _imsak = _$v.imsak;
      _fajr = _$v.fajr;
      _sunrise = _$v.sunrise;
      _dhuha = _$v.dhuha;
      _dhuhr = _$v.dhuhr;
      _asr = _$v.asr;
      _sunset = _$v.sunset;
      _maghrib = _$v.maghrib;
      _isha = _$v.isha;
      _midnight = _$v.midnight;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Prayers other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Prayers;
  }

  @override
  void update(void Function(PrayersBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Prayers build() {
    final _$result = _$v ??
        new _$Prayers._(
            imsak: imsak,
            fajr: fajr,
            sunrise: sunrise,
            dhuha: dhuha,
            dhuhr: dhuhr,
            asr: asr,
            sunset: sunset,
            maghrib: maghrib,
            isha: isha,
            midnight: midnight);
    replace(_$result);
    return _$result;
  }
}

class _$Prayer extends Prayer {
  @override
  final PrayerType type;
  @override
  final DateTime time;

  factory _$Prayer([void Function(PrayerBuilder) updates]) =>
      (new PrayerBuilder()..update(updates)).build();

  _$Prayer._({this.type, this.time}) : super._() {
    if (type == null) {
      throw new BuiltValueNullFieldError('Prayer', 'type');
    }
    if (time == null) {
      throw new BuiltValueNullFieldError('Prayer', 'time');
    }
  }

  @override
  Prayer rebuild(void Function(PrayerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PrayerBuilder toBuilder() => new PrayerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Prayer && type == other.type && time == other.time;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, type.hashCode), time.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Prayer')
          ..add('type', type)
          ..add('time', time))
        .toString();
  }
}

class PrayerBuilder implements Builder<Prayer, PrayerBuilder> {
  _$Prayer _$v;

  PrayerType _type;
  PrayerType get type => _$this._type;
  set type(PrayerType type) => _$this._type = type;

  DateTime _time;
  DateTime get time => _$this._time;
  set time(DateTime time) => _$this._time = time;

  PrayerBuilder();

  PrayerBuilder get _$this {
    if (_$v != null) {
      _type = _$v.type;
      _time = _$v.time;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Prayer other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Prayer;
  }

  @override
  void update(void Function(PrayerBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Prayer build() {
    final _$result = _$v ?? new _$Prayer._(type: type, time: time);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
