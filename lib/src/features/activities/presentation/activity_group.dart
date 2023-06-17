import 'package:flutter/material.dart';
import 'package:odyssey/src/features/activities/model/activity.dart';
import 'package:odyssey/src/features/activities/presentation/activity_chips.dart';

class ActivityGroup extends StatelessWidget {
  const ActivityGroup({super.key, required this.activityCategory, required this.selectedActivities, required this.onSelectedActivity});

  final ActivityCategory activityCategory;
  final List<Activity> selectedActivities;
  final Function(Activity) onSelectedActivity;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        childrenPadding: const EdgeInsets.all(12),
        initiallyExpanded: true,
        title: Text(activityCategory.categoryName),
        shape: const RoundedRectangleBorder(),
        children: [
          ActivityChips(
            activityCategory.activityList,
            onActivitySelected: onSelectedActivity,
            selectedActivities: selectedActivities,
          ),
        ],
      ),
    );
  }
}
