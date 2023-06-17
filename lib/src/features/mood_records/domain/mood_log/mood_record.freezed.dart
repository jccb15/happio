// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mood_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MoodRecord {
// @HiveField(0) required int? id,
  @HiveField(0)
  String get label => throw _privateConstructorUsedError;
  @HiveField(1)
  int get score => throw _privateConstructorUsedError;
  @HiveField(2)
  String get iconPath => throw _privateConstructorUsedError;
  @HiveField(3)
  int get color => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get note => throw _privateConstructorUsedError;
  @HiveField(6)
  List<Activity> get activities => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoodRecordCopyWith<MoodRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoodRecordCopyWith<$Res> {
  factory $MoodRecordCopyWith(
          MoodRecord value, $Res Function(MoodRecord) then) =
      _$MoodRecordCopyWithImpl<$Res, MoodRecord>;
  @useResult
  $Res call(
      {@HiveField(0) String label,
      @HiveField(1) int score,
      @HiveField(2) String iconPath,
      @HiveField(3) int color,
      @HiveField(4) DateTime date,
      @HiveField(5) String? note,
      @HiveField(6) List<Activity> activities});
}

/// @nodoc
class _$MoodRecordCopyWithImpl<$Res, $Val extends MoodRecord>
    implements $MoodRecordCopyWith<$Res> {
  _$MoodRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? score = null,
    Object? iconPath = null,
    Object? color = null,
    Object? date = null,
    Object? note = freezed,
    Object? activities = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      iconPath: null == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      activities: null == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<Activity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MoodRecordCopyWith<$Res>
    implements $MoodRecordCopyWith<$Res> {
  factory _$$_MoodRecordCopyWith(
          _$_MoodRecord value, $Res Function(_$_MoodRecord) then) =
      __$$_MoodRecordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String label,
      @HiveField(1) int score,
      @HiveField(2) String iconPath,
      @HiveField(3) int color,
      @HiveField(4) DateTime date,
      @HiveField(5) String? note,
      @HiveField(6) List<Activity> activities});
}

/// @nodoc
class __$$_MoodRecordCopyWithImpl<$Res>
    extends _$MoodRecordCopyWithImpl<$Res, _$_MoodRecord>
    implements _$$_MoodRecordCopyWith<$Res> {
  __$$_MoodRecordCopyWithImpl(
      _$_MoodRecord _value, $Res Function(_$_MoodRecord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? score = null,
    Object? iconPath = null,
    Object? color = null,
    Object? date = null,
    Object? note = freezed,
    Object? activities = null,
  }) {
    return _then(_$_MoodRecord(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      iconPath: null == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      activities: null == activities
          ? _value._activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<Activity>,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 0)
class _$_MoodRecord implements _MoodRecord {
  const _$_MoodRecord(
      {@HiveField(0) required this.label,
      @HiveField(1) required this.score,
      @HiveField(2) required this.iconPath,
      @HiveField(3) required this.color,
      @HiveField(4) required this.date,
      @HiveField(5) this.note,
      @HiveField(6) final List<Activity> activities = const []})
      : _activities = activities;

// @HiveField(0) required int? id,
  @override
  @HiveField(0)
  final String label;
  @override
  @HiveField(1)
  final int score;
  @override
  @HiveField(2)
  final String iconPath;
  @override
  @HiveField(3)
  final int color;
  @override
  @HiveField(4)
  final DateTime date;
  @override
  @HiveField(5)
  final String? note;
  final List<Activity> _activities;
  @override
  @JsonKey()
  @HiveField(6)
  List<Activity> get activities {
    if (_activities is EqualUnmodifiableListView) return _activities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activities);
  }

  @override
  String toString() {
    return 'MoodRecord(label: $label, score: $score, iconPath: $iconPath, color: $color, date: $date, note: $note, activities: $activities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoodRecord &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.iconPath, iconPath) ||
                other.iconPath == iconPath) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.note, note) || other.note == note) &&
            const DeepCollectionEquality()
                .equals(other._activities, _activities));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, score, iconPath, color,
      date, note, const DeepCollectionEquality().hash(_activities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MoodRecordCopyWith<_$_MoodRecord> get copyWith =>
      __$$_MoodRecordCopyWithImpl<_$_MoodRecord>(this, _$identity);
}

abstract class _MoodRecord implements MoodRecord {
  const factory _MoodRecord(
      {@HiveField(0) required final String label,
      @HiveField(1) required final int score,
      @HiveField(2) required final String iconPath,
      @HiveField(3) required final int color,
      @HiveField(4) required final DateTime date,
      @HiveField(5) final String? note,
      @HiveField(6) final List<Activity> activities}) = _$_MoodRecord;

  @override // @HiveField(0) required int? id,
  @HiveField(0)
  String get label;
  @override
  @HiveField(1)
  int get score;
  @override
  @HiveField(2)
  String get iconPath;
  @override
  @HiveField(3)
  int get color;
  @override
  @HiveField(4)
  DateTime get date;
  @override
  @HiveField(5)
  String? get note;
  @override
  @HiveField(6)
  List<Activity> get activities;
  @override
  @JsonKey(ignore: true)
  _$$_MoodRecordCopyWith<_$_MoodRecord> get copyWith =>
      throw _privateConstructorUsedError;
}
