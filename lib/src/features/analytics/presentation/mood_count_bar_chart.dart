import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odyssey/gen/assets.gen.dart';
import 'package:odyssey/src/features/mood_records/domain/mood_log/mood_record.dart';

class MoodCountBarChart extends StatelessWidget {
  const MoodCountBarChart({
    super.key,
    required this.moodRecords,
  });

  final List<MoodRecord> moodRecords;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      height: 180,
      child: moodRecords.isEmpty
          ? const Center(
              child: Text("Not enough data..."),
            )
          : BarChart(
              BarChartData(
                barGroups: _getBarChartGroups(moodRecords),
                titlesData: FlTitlesData(
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) => Container(),
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                      getTitlesWidget: (value, meta) => Container(),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: titleWidgets,
                      reservedSize: 40,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(
                  drawVerticalLine: false,
                  horizontalInterval: 1,
                ),
              ),
            ),
    );
  }

  List<BarChartGroupData> _getBarChartGroups(List<MoodRecord> records) {
    var groups = groupBy(
      records,
      (e) {
        return e.score;
      },
    );

    var list = List.generate(
      5,
      (index) {
        return BarChartGroupData(
          x: index + 1,
          barRods: [
            BarChartRodData(
                toY: groups[index + 1] != null ? groups[index + 1]!.length.toDouble() : 0.0,
                color: _getColorByMoodScore(index + 1),
                width: 20)
          ],
        );
      },
    );
    return list;
  }

  Color? _getColorByMoodScore(int score) {
    Color? color;
    switch (score) {
      case 1:
        color = Colors.red;
        break;
      case 2:
        color = Colors.orange;
        break;
      case 3:
        color = Colors.blue;
        break;
      case 4:
        color = Colors.cyan;
        break;
      case 5:
        color = Colors.green;
        break;
      default:
        color = null;
    }
    return color;
  }

  Widget titleWidgets(double score, TitleMeta meta) {
    String icon;
    Color color;
    switch (score.toInt()) {
      case 1:
        icon = Assets.moodIcons.crying;
        color = Colors.red;
        break;
      case 2:
        icon = Assets.moodIcons.confused;
        color = Colors.orange;
        break;
      case 3:
        icon = Assets.moodIcons.neutral;
        color = Colors.blue;
        break;
      case 4:
        icon = Assets.moodIcons.smile;
        color = Colors.cyan;
        break;
      case 5:
        icon = Assets.moodIcons.happy;
        color = Colors.green;
        break;
      default:
        throw StateError('Invalid');
    }
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: SvgPicture.asset(
        icon,
        color: color,
        height: 32,
        width: 32,
      ),
    );
  }
}
