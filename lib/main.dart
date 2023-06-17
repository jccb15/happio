import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:odyssey/src/features/activities/model/activity.dart';
import 'package:odyssey/src/features/mood_records/data/mood_log/mood_record_repository.dart';
import 'package:odyssey/src/features/mood_records/domain/mood_log/mood_record.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(MoodRecordAdapter());
  Hive.registerAdapter(ActivityAdapter());

  final moodRecordsRepository = await MoodRecordRepository.createRepository();

  runApp(
    ProviderScope(
      overrides: [moodRecordRepositoryProvider.overrideWithValue(moodRecordsRepository)],
      child: const MyApp(),
    ),
  );
}
