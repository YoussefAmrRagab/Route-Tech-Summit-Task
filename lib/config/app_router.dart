import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_flutter_task/presentation/screens/home_screen.dart';
import 'package:route_flutter_task/presentation/view_models/home_cubit.dart';
import 'package:route_flutter_task/utils/dependency_injection.dart';
import 'app_strings.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: const HomeScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
