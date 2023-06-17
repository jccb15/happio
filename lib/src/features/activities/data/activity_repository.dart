import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:odyssey/src/features/activities/data/activity_categories.dart';
import 'package:odyssey/src/features/activities/model/activity.dart';

class ActivityRepository {
  ActivityRepository(this._activityCategoriesbox);
  final Box<ActivityCategory> _activityCategoriesbox;

  Box<ActivityCategory> get box => _activityCategoriesbox;

  List<ActivityCategory> getCategories() {
    return kActivityCategories;
  }
}

final activityRepositoryProvider = FutureProvider<ActivityRepository>(
  (ref) async {
    final box = await Hive.openBox<ActivityCategory>("activity_categories");

    ref.onDispose(() => box.close());

    return ActivityRepository(box);
  },
);
