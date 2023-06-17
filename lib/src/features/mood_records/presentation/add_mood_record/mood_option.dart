import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odyssey/src/constants/app_sizes.dart';
import 'package:odyssey/src/features/mood_records/domain/add_mood_record/mood_option.dart';

class MoodOption extends StatelessWidget {
  const MoodOption({
    super.key,
    required this.moodConfiguration,
    required this.isSelected,
    // required this.onTap,
  });

  final MoodConfiguration moodConfiguration;
  final bool isSelected;
  // final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Card(
        elevation: isSelected ? 4 : 0,
        color: isSelected ? moodConfiguration.color : Theme.of(context).colorScheme.surfaceVariant,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              SvgPicture.asset(
                moodConfiguration.iconPath,
                color: isSelected ? Theme.of(context).colorScheme.surface : moodConfiguration.color,
                height: Sizes.p64,
                width: Sizes.p64,
              ),
              gapH4,
              Text(
                moodConfiguration.label,
                style: TextStyle(
                  color: isSelected ? Theme.of(context).colorScheme.surface : moodConfiguration.color,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
