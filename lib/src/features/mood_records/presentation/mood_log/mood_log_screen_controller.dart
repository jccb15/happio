// import 'dart:async';
import 'dart:collection';

import 'package:collection/collection.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:odyssey/src/features/mood_records/data/mood_log/mood_record_repository.dart';
import 'package:odyssey/src/features/mood_records/domain/mood_log/mood_record.dart';

class MoodRecordsScreenController extends Notifier<MoodRecordRepository> {
  late final MoodRecordRepository _repository;

  @override
  MoodRecordRepository build() {
    _repository = ref.watch(moodRecordRepositoryProvider);
    return _repository;
  }

  MoodRecordRepository get repository => _repository;

  SplayTreeMap<String, List<MapEntry<dynamic, MoodRecord>>> groupMoodRecordsByDay(Map<dynamic, MoodRecord> boxMap) {
    // final records = _repository.box.toMap().entries;
    final groups = groupBy(boxMap.entries, (record) => DateFormat("yyyy-MM-dd").format(record.value.date));
    return SplayTreeMap.from(
      groups,
      (key1, key2) => key2.compareTo(key1),
    );
  }
}

final moodRecordScreenControllerProvider =
    NotifierProvider<MoodRecordsScreenController, MoodRecordRepository>(MoodRecordsScreenController.new);
