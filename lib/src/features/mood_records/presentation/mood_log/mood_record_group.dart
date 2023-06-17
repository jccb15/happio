import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:odyssey/src/features/mood_records/domain/mood_log/mood_record.dart';
import 'package:odyssey/src/features/mood_records/presentation/mood_log/mood_record_card.dart';

class MoodRecordGroup extends StatelessWidget {
  const MoodRecordGroup({super.key, required this.groupDate, required this.moodList});
  final DateTime groupDate;
  final List<MapEntry<dynamic, MoodRecord>> moodList;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (moodList.length > 1)
            Container(
              margin: const EdgeInsets.only(top: 15, left: 15),
              child: Text(
                DateFormat('EEEE, MMMM d').format(groupDate),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ...moodList.map(
            (record) => MoodRecordCard(
              recordEntry: record,
              isFirst: record == moodList.first,
              isLast: record == moodList.last,
              showDate: moodList.length == 1,
            ),
          )
        ],
      ),
    );
  }
}
