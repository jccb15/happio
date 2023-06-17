import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:odyssey/src/features/mood_records/data/mood_log/mood_record_repository.dart';
import 'package:odyssey/src/features/mood_records/domain/mood_log/mood_record.dart';
import 'package:odyssey/src/features/mood_records/presentation/mood_log/mood_log_screen.dart';
import 'package:odyssey/src/localization/string_hardcoded.dart';

enum MoodRecordCardMenuOption { delete, edit, addNote, addPhoto }

class MoodRecordCardOptions extends StatelessWidget {
  const MoodRecordCardOptions({
    super.key,
    required this.id,
    required this.recordEntry,
    required this.record,
  });

  final dynamic id;
  final MapEntry<dynamic, MoodRecord> recordEntry;
  final MoodRecord record;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => PopupMenuButton<MoodRecordCardMenuOption>(
        onSelected: (value) {
          switch (value) {
            case MoodRecordCardMenuOption.delete:
              () {
                final repository = ref.read(moodRecordRepositoryProvider);
                repository.deleteMoodRecord(id);
              }();
              break;
            case MoodRecordCardMenuOption.edit:
              MoodRecordsScreen.showAddMoodRecordForm(context, recordEntry);
              break;
            default:
          }
        },
        itemBuilder: (context) {
          return [
            PopupMenuItem<MoodRecordCardMenuOption>(
              value: MoodRecordCardMenuOption.edit,
              child: Text("Edit".hardcoded),
            ),
            // PopupMenuItem<MoodRecordCardMenuOption>(
            //   value: MoodRecordCardMenuOption.addNote,
            //   child: Text(record.note == null ? "Add Note".hardcoded : "Edit Note".hardcoded),
            // ),
            // PopupMenuItem<MoodRecordCardMenuOption>(
            //   value: MoodRecordCardMenuOption.addPhoto,
            //   child: Text("Add Photo".hardcoded),
            // ),
            PopupMenuItem<MoodRecordCardMenuOption>(
              value: MoodRecordCardMenuOption.delete,
              child: Text(
                "Delete".hardcoded,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ];
        },
      ),
    );
  }
}
