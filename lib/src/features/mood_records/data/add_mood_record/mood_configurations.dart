import 'package:flutter/material.dart';
import 'package:odyssey/gen/assets.gen.dart';
import 'package:odyssey/src/features/mood_records/domain/add_mood_record/mood_option.dart';

//TODO: provide these list with a provider, grouped by score to allow different mood options
final List<MoodConfiguration> kMoodConfigurations = [
  MoodConfiguration(iconPath: Assets.moodIcons.happy, color: Colors.green, label: "Great", score: 5),
  MoodConfiguration(iconPath: Assets.moodIcons.smile, color: Colors.cyan, label: "Positive", score: 4),
  MoodConfiguration(iconPath: Assets.moodIcons.neutral, color: Colors.blue, label: "Alright", score: 3),
  MoodConfiguration(iconPath: Assets.moodIcons.confused, color: Colors.orange, label: "Bad", score: 2),
  MoodConfiguration(iconPath: Assets.moodIcons.crying, color: Colors.red, label: "Awful", score: 1),
];
