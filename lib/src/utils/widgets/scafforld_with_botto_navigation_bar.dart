import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:odyssey/src/utils/widgets/scafforld_with_botto_navigation_bar_item.dart';

class ScaffoldWithBottomNavigationBar extends StatefulWidget {
  const ScaffoldWithBottomNavigationBar({Key? key, required this.child, required this.destinations}) : super(key: key);
  final Widget child;
  final List<ScaffoldWithBottomNavigationBarItem> destinations;

  @override
  State<ScaffoldWithBottomNavigationBar> createState() => _ScaffoldWithBottomNavigationBarState();
}

class _ScaffoldWithBottomNavigationBarState extends State<ScaffoldWithBottomNavigationBar> {
  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  int _locationToTabIndex(String location) {
    final index = widget.destinations.indexWhere((t) => location.startsWith(GoRouter.of(context).namedLocation(t.route.name)));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  void _onItemTapped(BuildContext context, int destinationIndex) {
    if (destinationIndex != _currentIndex) {
      // go to the initial location of the selected tab (by index)
      context.goNamed(widget.destinations[destinationIndex].route.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        destinations: widget.destinations,
        onDestinationSelected: (index) => _onItemTapped(context, index),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        height: 60,
      ),
    );
  }
}
