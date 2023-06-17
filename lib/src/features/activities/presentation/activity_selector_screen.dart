import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:odyssey/src/constants/app_sizes.dart';
import 'package:odyssey/src/features/activities/data/activity_repository.dart';
import 'package:odyssey/src/features/activities/model/activity.dart';
import 'package:odyssey/src/features/activities/presentation/activity_group.dart';
import 'package:odyssey/src/utils/widgets/responsive_centered.dart';

class ActivitySelectorScreen extends ConsumerStatefulWidget {
  const ActivitySelectorScreen({super.key, required this.recordActivities, required this.updateActivitiesCallback});
  // final MoodRecord =
  final Function updateActivitiesCallback;
  final List<Activity> recordActivities;

  @override
  ConsumerState<ActivitySelectorScreen> createState() => _ActivitySelectorScreenState();
}

class _ActivitySelectorScreenState extends ConsumerState<ActivitySelectorScreen> {
  late List<Activity> _selectedActivities;

  void _addOrRemoveActivity(Activity activity) {
    setState(
      () {
        if (_selectedActivities.contains(activity)) {
          _selectedActivities.remove(activity);
        } else {
          _selectedActivities.add(activity);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _selectedActivities = List.of(widget.recordActivities);
  }

  @override
  Widget build(BuildContext context) {
    final activityCategoriesValue = ref.watch(activityRepositoryProvider);
    return activityCategoriesValue.when(
      data: (repository) {
        final categories = repository.getCategories();

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.close),
            ),
            actions: [
              ElevatedButton.icon(
                onPressed: () {
                  widget.updateActivitiesCallback(_selectedActivities);
                  context.pop();
                },
                icon: const Icon(Icons.save_alt),
                label: const Text("Add"),
              ),
              gapW12
            ],
          ),
          body: SingleChildScrollView(
            child: ResponsiveCenter(
              padding: const EdgeInsets.all(Sizes.p16),
              child: Column(
                children: [
                  Text(
                    "What have you been up to?",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  gapH12,
                  for (var category in categories)
                    ActivityGroup(
                      activityCategory: category,
                      selectedActivities: _selectedActivities,
                      onSelectedActivity: _addOrRemoveActivity,
                    ),
                ],
              ),
            ),
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) {
        return Text("Error: ${error.toString()}");
      },
    );
  }
}
