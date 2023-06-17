import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part "activity.g.dart";
part "activity.freezed.dart";

@freezed
abstract class Activity with _$Activity {
  @HiveType(typeId: 1)
  const factory Activity({
    @HiveField(0) required String activityName,
    @HiveField(1) required int iconCode,
  }) = _Activity;

  // final String activityName;
  // final int iconCode;
}

class ActivityCategory {
  ActivityCategory({required this.categoryName, required this.activityList});

  final String categoryName;
  final List<Activity> activityList;
}
