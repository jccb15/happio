import 'package:flutter/material.dart';

class MoodConfiguration {
  String label;
  String iconPath;
  Color color;
  int score;

  MoodConfiguration({
    required this.label,
    required this.iconPath,
    required this.color,
    required this.score,
  });
}
