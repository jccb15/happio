import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:odyssey/src/features/activities/presentation/activity_chips.dart';
import 'package:odyssey/src/features/mood_records/domain/mood_log/mood_record.dart';
import 'package:odyssey/src/features/mood_records/presentation/mood_log/mood_record_card_options.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MoodRecordCard extends StatelessWidget {
  const MoodRecordCard({
    super.key,
    required this.recordEntry,
    this.isFirst = false,
    this.isLast = false,
    this.showDate = false,
  });
  final MapEntry<dynamic, MoodRecord> recordEntry;
  final bool isFirst;
  final bool isLast;
  final bool showDate;

  @override
  Widget build(BuildContext context) {
    final id = recordEntry.key;
    final record = recordEntry.value;

    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      afterLineStyle: LineStyle(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        thickness: 3,
      ),
      endChild: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        constraints: const BoxConstraints(minHeight: 85),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (showDate)
                    Column(
                      children: [
                        Text(
                          DateFormat('EEEE, MMMM d').format(record.date).toString(),
                        ),
                        const SizedBox(
                          height: 4,
                        )
                      ],
                    ),
                  Row(
                    children: [
                      Text(
                        record.label,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Color(record.color),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(DateFormat.jm().format(record.date).toString())
                    ],
                  ),
                  if (record.activities.isNotEmpty)
                    Column(
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        ActivityChips(
                          record.activities,
                          alignment: WrapAlignment.start,
                        ),
                      ],
                    ),
                  if (record.note != null)
                    Column(
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyLarge,
                            children: [
                              TextSpan(
                                text: "Note: ",
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: record.note!),
                            ],
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
            MoodRecordCardOptions(id: id, recordEntry: recordEntry, record: record)
          ],
        ),
      ),
      indicatorStyle: IndicatorStyle(
        indicatorXY: showDate ? .5 : 0,
        padding: const EdgeInsets.all(1),
        height: 64,
        width: 64,
        indicator: SvgPicture.asset(
          record.iconPath,
          color: Color(record.color),
        ),
      ),
    );
  }
}
