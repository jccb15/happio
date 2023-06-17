import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:odyssey/src/features/activities/model/activity.dart';
import 'package:odyssey/src/features/activities/presentation/activity_selector_screen.dart';
import 'package:odyssey/src/features/analytics/presentation/analytics_screen.dart';
import 'package:odyssey/src/features/mood_records/presentation/mood_log/mood_log_screen.dart';
import 'package:odyssey/src/routing/not_found_screen.dart';
import 'package:odyssey/src/utils/widgets/scafforld_with_botto_navigation_bar.dart';
import 'package:odyssey/src/utils/widgets/scafforld_with_botto_navigation_bar_item.dart';
// import 'package:odyssey/src/features/calendar/application/calendar_screen.dart';
// import 'package:odyssey/src/features/settings/application/settings_screen.dart';

import 'app_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: "/records",
    navigatorKey: _rootNavigatorKey,
    routes: [
      // GoRoute(
      //   path: "/",
      //   builder: (context, state) => const NotFoundScreen(),
      // ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => ScaffoldWithBottomNavigationBar(
          destinations: _destinations,
          child: child,
        ),
        routes: [
          GoRoute(
            path: "/records",
            name: AppRoute.moodRecords.name,
            pageBuilder: (context, state) => const NoTransitionPage(child: MoodRecordsScreen()),
            parentNavigatorKey: _shellNavigatorKey,
          ),
          GoRoute(
            path: "/analytics",
            name: AppRoute.analytics.name,
            pageBuilder: (context, state) => const NoTransitionPage(child: AnalyticsScreen()),
            parentNavigatorKey: _shellNavigatorKey,
          ),
          // GoRoute(
          //   path: "/calendar",
          //   name: AppRoute.calendar.name,
          //   pageBuilder: (context, state) => const NoTransitionPage(child: CalendarScreen()),
          //   parentNavigatorKey: _shellNavigatorKey,
          // ),
          // GoRoute(
          //   path: "/settings",
          //   name: AppRoute.settings.name,
          //   pageBuilder: (context, state) => const NoTransitionPage(child: SettingsScreen()),
          //   parentNavigatorKey: _shellNavigatorKey,
          // ),
        ],
      ),
      GoRoute(
        path: "/selectActivities",
        name: AppRoute.selectActivities.name,
        builder: (context, state) {
          final (activities, updateActivities) = state.extra as (List<Activity>, Function);
          return ActivitySelectorScreen(
            recordActivities: activities,
            updateActivitiesCallback: updateActivities,
          );
        },
        parentNavigatorKey: _rootNavigatorKey,
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
});

const _destinations = [
  ScaffoldWithBottomNavigationBarItem(
    route: AppRoute.moodRecords,
    icon: Icon(Icons.view_agenda_outlined),
    selectedIcon: Icon(Icons.view_agenda),
    label: "Log",
  ),
  ScaffoldWithBottomNavigationBarItem(
    route: AppRoute.analytics,
    icon: Icon(Icons.auto_graph_outlined),
    selectedIcon: Icon(Icons.auto_graph),
    label: "Insights",
  ),

  // ScaffoldWithBottomNavigationBarItem(
  //   route: AppRoute.calendar,
  //   icon: Icon(Icons.calendar_month_outlined),
  //   selectedIcon: Icon(Icons.calendar_month),
  //   label: "Calendar",
  // ),
  // ScaffoldWithBottomNavigationBarItem(
  //   route: AppRoute.settings,
  //   icon: Icon(Icons.settings_outlined),
  //   selectedIcon: Icon(Icons.settings),
  //   label: "Settings",
  // ),
];
