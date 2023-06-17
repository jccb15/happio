import 'package:flutter/material.dart';
import 'package:odyssey/src/features/activities/model/activity.dart';

final kActivityCategories = [
  ActivityCategory(
    categoryName: "Social",
    activityList: [
      Activity(activityName: "family", iconCode: Icons.diversity_3.codePoint),
      Activity(activityName: "friends", iconCode: Icons.groups.codePoint),
      Activity(activityName: "date", iconCode: Icons.favorite.codePoint),
      Activity(activityName: "party", iconCode: Icons.nightlife.codePoint),
    ],
  ),
  ActivityCategory(
    categoryName: "Hobbies",
    activityList: [
      Activity(activityName: "movies & tv", iconCode: Icons.live_tv.codePoint),
      Activity(activityName: "reading", iconCode: Icons.book.codePoint),
      Activity(activityName: "gaming", iconCode: Icons.gamepad_outlined.codePoint),
      Activity(activityName: "relax", iconCode: Icons.weekend.codePoint),
    ],
  ),
  ActivityCategory(
    categoryName: "Sleep",
    activityList: [
      Activity(activityName: "sleep early", iconCode: Icons.alarm_on.codePoint),
      Activity(activityName: "good sleep", iconCode: Icons.bedtime.codePoint),
      Activity(activityName: "medium sleep", iconCode: Icons.bedtime_outlined.codePoint),
      Activity(activityName: "bad sleep", iconCode: Icons.bedtime_off_outlined.codePoint),
    ],
  ),
  ActivityCategory(
    categoryName: "Health",
    activityList: [
      Activity(activityName: "excercise", iconCode: Icons.fitness_center.codePoint),
      Activity(activityName: "drink water", iconCode: Icons.local_drink.codePoint),
      Activity(activityName: "walk", iconCode: Icons.directions_walk.codePoint),
    ],
  ),
  ActivityCategory(
    categoryName: "Better Me",
    activityList: [
      Activity(activityName: "meditation", iconCode: Icons.self_improvement_outlined.codePoint),
      Activity(activityName: "kindness", iconCode: Icons.volunteer_activism.codePoint),
      Activity(activityName: "listen", iconCode: Icons.hearing.codePoint),
      Activity(activityName: "donate", iconCode: Icons.toll.codePoint),
      Activity(activityName: "give gift", iconCode: Icons.redeem.codePoint),
    ],
  ),
  ActivityCategory(
    categoryName: "Chores",
    activityList: [
      Activity(activityName: "shopping", iconCode: Icons.shopping_bag_outlined.codePoint),
      Activity(activityName: "cleaning", iconCode: Icons.cleaning_services.codePoint),
      Activity(activityName: "cooking", iconCode: Icons.restaurant_menu.codePoint),
      Activity(activityName: "laundry", iconCode: Icons.local_laundry_service_outlined.codePoint),
    ],
  ),
];
