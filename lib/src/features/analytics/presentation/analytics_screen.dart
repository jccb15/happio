import 'package:flutter/material.dart';
import 'package:odyssey/src/features/analytics/presentation/chart_frame_card.dart';
import 'package:odyssey/src/utils/widgets/responsive_centered.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Insights"),
      ),
      body: ResponsiveCenter(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, kFloatingActionButtonMargin * 2 + 48),
                children: const [
                  ChartFrame(chartType: ChartType.moodCount, title: "Mood Count"),
                  ChartFrame(chartType: ChartType.moodVariation, title: "Mood Fluctuation"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
