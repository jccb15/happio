import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_routes.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text("Not Found"),
            ElevatedButton(onPressed: () => context.goNamed(AppRoute.moodRecords.name), child: const Text("Go Home"))
          ],
        ),
      ),
    );
  }
}
