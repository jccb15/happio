import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:odyssey/src/features/analytics/presentation/chart_frame_controller.dart';
import 'package:odyssey/src/features/analytics/presentation/mood_count_bar_chart.dart';
import 'package:odyssey/src/features/analytics/presentation/mood_variation_line_chart.dart';
import 'package:odyssey/src/features/mood_records/domain/mood_log/mood_record.dart';

enum ChartType { moodCount, moodVariation }

enum ChartFilter {
  sevenDays,
  month,
  all,
  year,
}

class ChartFrame extends ConsumerStatefulWidget {
  const ChartFrame({
    Key? key,
    required this.chartType,
    required this.title,
  }) : super(key: key);

  final ChartType chartType;
  final String title;

  @override
  ConsumerState<ChartFrame> createState() => _ChartFrameState();
}

class _ChartFrameState extends ConsumerState<ChartFrame> {
  ChartFilter _dropdownValue = ChartFilter.sevenDays;
  // List<MoodRecord> _moodRecords = [];

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(chartFrameControllerProvider(_dropdownValue).notifier);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                DropdownButton(
                    value: _dropdownValue,
                    items: const [
                      DropdownMenuItem(
                        value: ChartFilter.sevenDays,
                        child: (Text("Week")),
                      ),
                      DropdownMenuItem(
                        value: ChartFilter.month,
                        child: (Text("Month")),
                      ),
                      DropdownMenuItem(
                        value: ChartFilter.year,
                        child: (Text("Year")),
                      ),
                      DropdownMenuItem(
                        value: ChartFilter.all,
                        child: (Text("All")),
                      ),
                    ],
                    onChanged: (filter) {
                      setState(() {
                        _dropdownValue = filter!;
                      });
                    }),
                const SizedBox(
                  width: 8,
                ),
                // IconButton(onPressed: () {}, icon: const Icon(Icons.share))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
              valueListenable: controller.moodRecordsRepository.box.listenable(),
              builder: (context, box, _) {
                return buildChart(widget.chartType, controller.records);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildChart(ChartType type, List<MoodRecord> moodRecords) {
    return switch (type) {
      ChartType.moodCount => MoodCountBarChart(moodRecords: moodRecords),
      ChartType.moodVariation => MoodVariationLineChart(moodRecords: moodRecords),
    };
  }
}
