import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:odyssey/src/features/activities/model/activity.dart';

part "mood_record.g.dart";
part "mood_record.freezed.dart";

@freezed
abstract class MoodRecord with _$MoodRecord {
  @HiveType(typeId: 0)
  const factory MoodRecord({
    // @HiveField(0) required int? id,
    @HiveField(0) required String label,
    @HiveField(1) required int score,
    @HiveField(2) required String iconPath,
    @HiveField(3) required int color,
    @HiveField(4) required DateTime date,
    @HiveField(5) String? note,
    @HiveField(6) @Default([]) List<Activity> activities,
  }) = _MoodRecord;

  // factory MoodRecord.fromJson(Map<String, dynamic> json) => _$MoodRecordFromJson(json);
}
