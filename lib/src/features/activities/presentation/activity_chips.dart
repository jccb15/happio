import 'package:flutter/material.dart';
import 'package:odyssey/src/features/activities/model/activity.dart';

class ActivityChips extends StatelessWidget {
  const ActivityChips(this.activities,
      {super.key, this.selectedActivities, this.onActivitySelected, this.alignment = WrapAlignment.center});

  final List<Activity> activities;
  final List<Activity>? selectedActivities;
  final Function(Activity)? onActivitySelected;
  final WrapAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      runAlignment: alignment,
      alignment: alignment,
      children: activities.map(
        (currentActivity) {
          final isSelected = selectedActivities == null ? true : selectedActivities!.contains(currentActivity);
          return FilterChip(
            avatar: Icon(
              IconData(currentActivity.iconCode, fontFamily: 'MaterialIcons'),
              color: isSelected ? Theme.of(context).colorScheme.onSecondaryContainer : Theme.of(context).colorScheme.onSurface,
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            label: Text(currentActivity.activityName),
            labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer),
            showCheckmark: false,
            selected: isSelected,
            selectedColor: Theme.of(context).colorScheme.secondaryContainer,
            visualDensity: VisualDensity.compact,
            onSelected: (value) {
              if (selectedActivities != null) {
                onActivitySelected!(currentActivity);
              }
            },
          );
        },
      ).toList(),
    );
  }
}
