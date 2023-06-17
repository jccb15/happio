import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:odyssey/src/features/analytics/presentation/chart_frame_card.dart';
import 'package:odyssey/src/features/mood_records/data/mood_log/mood_record_repository.dart';
import 'package:odyssey/src/features/mood_records/domain/mood_log/mood_record.dart';

class ChartFrameController extends AutoDisposeFamilyNotifier<List<MoodRecord>, ChartFilter> {
  late MoodRecordRepository moodRecordsRepository;

  @override
  List<MoodRecord> build(arg) {
    moodRecordsRepository = ref.read(moodRecordRepositoryProvider);
    return getFilteredRecords(arg);
  }

  // @override
  List<MoodRecord> get records => state;

  List<MoodRecord> getLastSevenDaysRecords() {
    final now = DateTime.now();
    final records = moodRecordsRepository.fetchMoodRecordsByDate(
      before: now,
      after: DateTime(now.year, now.month, now.day).subtract(
        const Duration(days: 7),
      ),
    );
    return records.values.toList();
  }

  List<MoodRecord> getThisMonthRecords() {
    final now = DateTime.now();
    final records = moodRecordsRepository.fetchMoodRecordsByDate(
      before: now,
      after: DateTime(now.year, now.month),
    );

    return records.values.toList();
  }

  List<MoodRecord> getThisYearRecords() {
    final now = DateTime.now();
    final records = moodRecordsRepository.fetchMoodRecordsByDate(
      before: now,
      after: DateTime(now.year),
    );
    return records.values.toList();
  }

  List<MoodRecord> getAllRecords() {
    final records = moodRecordsRepository.fetchMoodRecords();
    return records.values.toList();
  }

  List<MoodRecord> getFilteredRecords(ChartFilter filter) {
    final list = switch (filter) {
      ChartFilter.sevenDays => getLastSevenDaysRecords(),
      ChartFilter.month => getThisMonthRecords(),
      ChartFilter.year => getThisYearRecords(),
      ChartFilter.all => getAllRecords(),
    };
    return sortRecords(list);
  }

  List<MoodRecord> sortRecords(List<MoodRecord> records) {
    records = List.of(records);
    records.sort(
      (a, b) => a.date.compareTo(b.date),
    );
    return records;
  }
}

final chartFrameControllerProvider =
    NotifierProvider.family.autoDispose<ChartFrameController, List<MoodRecord>, ChartFilter>(ChartFrameController.new);
