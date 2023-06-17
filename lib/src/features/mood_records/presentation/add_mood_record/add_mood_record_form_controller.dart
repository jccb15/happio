import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:odyssey/gen/assets.gen.dart';
import 'package:odyssey/src/features/activities/model/activity.dart';
import 'package:odyssey/src/features/mood_records/domain/add_mood_record/mood_option.dart';
import 'package:odyssey/src/features/mood_records/data/mood_log/mood_record_repository.dart';
import 'package:odyssey/src/features/mood_records/domain/mood_log/mood_record.dart';
import 'package:odyssey/src/routing/app_routes.dart';

class AddMoodRecordFormControllerNotifier extends AutoDisposeFamilyNotifier<MoodRecord, MapEntry<dynamic, MoodRecord>?> {
  // AddMoodRecordFormControllerNotifier({this.toEdit});

  late final MapEntry<dynamic, MoodRecord>? toEdit;

  @override
  build(MapEntry<dynamic, MoodRecord>? arg) {
    // MoodConfiguration(iconPath: Assets.moodIcons.neutral, color: Colors.blue, label: "Alright", score: 3),
    if (arg == null) {
      return MoodRecord(
        label: "Alright",
        score: 3,
        iconPath: Assets.moodIcons.neutral,
        color: Colors.blue.value,
        date: DateTime.now(),
      );
    } else {
      toEdit = arg;
      return arg.value;
    }
  }

  void saveOrUpdate(dynamic key, MoodRecord value) {
    final moodRecordRepository = ref.read(moodRecordRepositoryProvider);
    if (key == null) {
      moodRecordRepository.createMoodRecord(value);
    } else {
      moodRecordRepository.updateMoodRecord(key, value);
    }
  }

  void updateTime(BuildContext context) async {
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: state.date.hour,
        minute: state.date.minute,
      ),
    );

    if (selectedTime != null) {
      state = state.copyWith(
        date: state.date.copyWith(
          hour: selectedTime.hour,
          minute: selectedTime.minute,
        ),
      );
    }
  }

  void updateDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: state.date,
      firstDate: DateTime.fromMillisecondsSinceEpoch(1),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      state = state.copyWith(
        date: state.date.copyWith(
          day: selectedDate.day,
          month: selectedDate.month,
          year: selectedDate.year,
        ),
      );
    }
  }

  void updateMoodConfiguration(MoodConfiguration configuration) {
    state = state.copyWith(
      label: configuration.label,
      color: configuration.color.value,
      iconPath: configuration.iconPath,
      score: configuration.score,
    );
  }

  void updateNote(String note) {
    if (note.isEmpty && state.note != note) {
      state = state.copyWith(note: null);
    }
    state = state.copyWith(note: note);
  }

  void openActivitySelector(BuildContext context) {
    context.pushNamed(
      AppRoute.selectActivities.name,
      extra: (state.activities, updateActivities),
    );
  }

  void updateActivities(List<Activity> activities) {
    state = state.copyWith(activities: activities);
  }
}

final addMoodRecordFormControllerNotifierProvider = NotifierProvider.autoDispose
    .family<AddMoodRecordFormControllerNotifier, MoodRecord, MapEntry<dynamic, MoodRecord>?>(AddMoodRecordFormControllerNotifier.new);
