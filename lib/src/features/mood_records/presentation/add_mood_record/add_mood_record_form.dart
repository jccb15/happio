import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:odyssey/src/constants/app_sizes.dart';
import 'package:odyssey/src/features/mood_records/data/add_mood_record/mood_configurations.dart';
import 'package:odyssey/src/features/activities/presentation/activity_chips.dart';
import 'package:odyssey/src/features/mood_records/domain/mood_log/mood_record.dart';
import 'package:odyssey/src/features/mood_records/presentation/add_mood_record/add_mood_record_form_controller.dart';
import 'package:odyssey/src/features/mood_records/presentation/add_mood_record/mood_option.dart';
import 'package:odyssey/src/localization/string_hardcoded.dart';

class AddMoodRecordForm extends ConsumerStatefulWidget {
  const AddMoodRecordForm({super.key, this.recordToEdit});

  final MapEntry<dynamic, MoodRecord>? recordToEdit;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddMoodRecordFormState();
  }
}

class _AddMoodRecordFormState extends ConsumerState<AddMoodRecordForm> {
  late final TextEditingController _noteController;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController(text: widget.recordToEdit?.value.note);
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    final tempMoodRecord = ref.watch(addMoodRecordFormControllerNotifierProvider(widget.recordToEdit));
    final controller = ref.read(addMoodRecordFormControllerNotifierProvider(widget.recordToEdit).notifier);
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(12, 12, 12, 12 + keyboardSpace),
      child: Column(
        children: [
          Text(
            "How are you feeling?".hardcoded,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          gapH16,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                onPressed: () => controller.updateDate(context),
                icon: const Icon(Icons.calendar_month_outlined),
                label: Row(
                  children: [
                    Text(DateFormat.yMMMd().format(tempMoodRecord.date)),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
              TextButton.icon(
                onPressed: () => controller.updateTime(context),
                icon: const Icon(Icons.access_time_outlined),
                label: Row(
                  children: [
                    Text(DateFormat.jm().format(tempMoodRecord.date)),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ],
          ),
          gapH16,
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: kMoodConfigurations
                  .map(
                    (config) => GestureDetector(
                      onTap: () => controller.updateMoodConfiguration(config),
                      child: MoodOption(moodConfiguration: config, isSelected: tempMoodRecord.score == config.score),
                    ),
                  )
                  .toList(),
            ),
          ),
          gapH16,
          OutlinedButton.icon(
            onPressed: () {
              controller.openActivitySelector(context);
            },
            label: Text(tempMoodRecord.activities.isEmpty ? "Add activities".hardcoded : "Edit activities".hardcoded),
            icon: Icon(tempMoodRecord.activities.isEmpty ? Icons.add : Icons.edit),
          ),
          gapH16,
          if (tempMoodRecord.activities.isNotEmpty)
            Column(
              children: [
                ActivityChips(tempMoodRecord.activities),
                gapH16,
              ],
            ),
          TextField(
            controller: _noteController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Add a note".hardcoded),
            maxLines: null,
            onChanged: (value) => controller.updateNote(value),
          ),
          gapH16,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text("Cancel"),
              ),
              gapW16,
              ElevatedButton(
                onPressed: () {
                  controller.saveOrUpdate(widget.recordToEdit?.key, tempMoodRecord);
                  context.pop();
                },
                child: const Text("Save"),
              )
            ],
          )
        ],
      ),
    );
  }
}
