import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:odyssey/src/features/mood_records/domain/mood_log/mood_record.dart';
import 'package:odyssey/src/features/mood_records/presentation/add_mood_record/add_mood_record_form.dart';
import 'package:odyssey/src/features/mood_records/presentation/mood_log/mood_record_group.dart';
import 'package:odyssey/src/features/mood_records/presentation/mood_log/mood_log_screen_controller.dart';
import 'package:odyssey/src/utils/widgets/responsive_centered.dart';

class MoodRecordsScreen extends ConsumerWidget {
  const MoodRecordsScreen({super.key});

  static void showAddMoodRecordForm(context, MapEntry<dynamic, MoodRecord>? recordToEdit) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      useRootNavigator: true,
      context: context,
      builder: (context) => AddMoodRecordForm(recordToEdit: recordToEdit),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(moodRecordScreenControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mood Log"),
      ),
      body: ResponsiveCenter(
        child: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: controller.repository.box.listenable(),
                builder: (context, box, child) {
                  if (controller.repository.box.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Start tracking your mood!",
                            // style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text("Press the '+' button", style: Theme.of(context).textTheme.titleLarge),
                        ],
                      ),
                    );
                  } else {
                    final groupedRecords = controller.groupMoodRecordsByDay(box.toMap());

                    return ListView.builder(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, kFloatingActionButtonMargin * 2 + 48),
                      itemCount: groupedRecords.length,
                      itemBuilder: (context, index) {
                        final currentGroup = groupedRecords.entries.elementAt(index);
                        return MoodRecordGroup(groupDate: DateTime.parse(currentGroup.key), moodList: currentGroup.value);
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddMoodRecordForm(context, null), //context.pushNamed(AppRoute.addRecord.name),
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
}
