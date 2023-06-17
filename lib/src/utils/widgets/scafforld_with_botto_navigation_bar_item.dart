import 'package:flutter/material.dart';
import 'package:odyssey/src/routing/app_routes.dart';

class ScaffoldWithBottomNavigationBarItem extends NavigationDestination {
  const ScaffoldWithBottomNavigationBarItem(
      {super.key, required this.route, required Widget icon, required Widget selectedIcon, required String label})
      : super(
          icon: icon,
          selectedIcon: selectedIcon,
          label: label,
        );
  final AppRoute route;

  // String get location =>
  //     GoRouter.of(context).namedLocation(initialRouteName.name);
}
