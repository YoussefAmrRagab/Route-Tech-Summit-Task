import 'package:flutter/material.dart';
import 'package:route_flutter_task/config/app_router.dart';
import 'config/app_strings.dart';
import 'utils/dependency_injection.dart';

void main() {
  setup();
  runApp(
    Application(
      appRouter: AppRouter(),
    ),
  );
}

class Application extends StatelessWidget {
  const Application({
    super.key,
    required this.appRouter,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: homeRoute,
    );
  }
}
