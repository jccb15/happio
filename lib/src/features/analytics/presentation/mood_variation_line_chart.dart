import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:odyssey/gen/assets.gen.dart';
import 'package:odyssey/src/features/mood_records/domain/mood_log/mood_record.dart';

class MoodVariationLineChart extends StatelessWidget {
  const MoodVariationLineChart({Key? key, required this.moodRecords}) : super(key: key);

  final List<MoodRecord> moodRecords;

  Map<String, List<MoodRecord>> groupRecordsByDate(List<MoodRecord> records) {
    final groups = groupBy(
      records,
      (MoodRecord r) {
        return DateFormat('yyyy-MM-dd').format(r.date);
      },
    );
    return groups;
  }

  List<FlSpot> getDots(Map<String, List<MoodRecord>> groupedRecords) {
    List<FlSpot> dots = [];
    var initialDate = groupedRecords[groupedRecords.keys.first]![0].date;
    var from = DateTime(initialDate.year, initialDate.month, initialDate.day);
    groupedRecords.forEach(
      (key, value) {
        dots.add(
          FlSpot((DateTime.parse(key).difference(from).inHours / 24).round().toDouble(),
              value.fold(0, (previousValue, element) => previousValue + element.score) / value.length),
        );
      },
    );
    return dots;
  }

  (int, int) getMinManScores(List<FlSpot> moods) {
    int minScore = 0;
    int maxScore = 0;
    if (moodRecords.isNotEmpty) {
      minScore = moods.reduce((curr, next) => curr.y < next.y ? curr : next).y.round();
      maxScore = moods.reduce((curr, next) => curr.y > next.y ? curr : next).y.round();
    }
    return (minScore, maxScore);
  }

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> dots = moodRecords.isNotEmpty ? getDots(groupRecordsByDate(moodRecords)) : [];
    final (minScore, maxScore) = getMinManScores(dots);

    return SizedBox(
      height: 180,
      child: dots.length < 2
          ? const Center(
              child: Text("Not enough data..."),
            )
          : LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: dots,
                    dotData: FlDotData(
                      show: false,
                      getDotPainter: (p0, p1, p2, p3) => FlDotCirclePainter(
                        color: Theme.of(context).colorScheme.primary,
                        radius: 4,
                        strokeColor: Theme.of(context).colorScheme.primary.withOpacity(.5),
                        strokeWidth: 2,
                      ),
                    ),
                    isCurved: true,
                    isStrokeCapRound: true,
                    preventCurveOverShooting: true,
                    color: minScore == maxScore
                        ? moodRecords.isNotEmpty
                            ? getGradientColors(minScore, maxScore)[0]
                            : Colors.red
                        : null,
                    gradient: minScore == maxScore
                        ? null
                        : LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: getGradientColors(minScore, maxScore),
                          ),
                    barWidth: 5,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: moodRecords.isEmpty
                          ? null
                          : LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.red.withOpacity(.35),
                                Colors.orange.withOpacity(.35),
                                Colors.blue.withOpacity(.35),
                                Colors.cyan.withOpacity(.35),
                                Colors.green.withOpacity(.35),
                              ].sublist(0, maxScore == 1 ? null : maxScore),
                            ),
                    ),
                  ),
                ],
                gridData: FlGridData(
                  drawVerticalLine: false,
                  horizontalInterval: 1,
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                titlesData: FlTitlesData(
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                      getTitlesWidget: (value, meta) => Container(),
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                      getTitlesWidget: (value, meta) => Container(),
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      getTitlesWidget: getLeftTitleWidgets,
                      reservedSize: 40,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: moodRecords.isEmpty ? false : true,
                      interval: 1, //86400000 milliseconds in a day
                      getTitlesWidget: moodRecords.isNotEmpty ? getBottomTitleWidgets : null,
                      reservedSize: 30,
                    ),
                  ),
                ),
                extraLinesData: ExtraLinesData(
                  extraLinesOnTop: false,
                ),
                minY: 1,
                maxY: 5,
              ),
            ),
    );
  }

  Widget getLeftTitleWidgets(double value, TitleMeta meta) {
    String icon;
    Color color;
    switch (value.toInt()) {
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
      margin: const EdgeInsets.only(right: 8),
      child: SvgPicture.asset(
        icon,
        color: color,
        height: 32,
        width: 32,
      ),
    );
  }

  Widget getBottomTitleWidgets(double value, TitleMeta meta) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Text(
        DateFormat("dd").format(
          moodRecords.first.date.add(
            Duration(
              days: value.toInt(),
            ),
          ),
        ),
      ),
    );
  }

  List<MaterialColor> getGradientColors(int minScore, int maxScore) {
    return [
      Colors.red,
      Colors.orange,
      Colors.blue,
      Colors.cyan,
      Colors.green,
    ].sublist((minScore - 1), maxScore);
  }
}
