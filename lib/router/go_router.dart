import 'package:delivery_app/features/dashboard/home.dart';
import 'package:delivery_app/features/dashboard/home2.dart';
import 'package:delivery_app/features/onboarding/login_screen.dart';
import 'package:delivery_app/features/onboarding/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes {
  login,
  register,
  home,
  home2,
}

final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');
final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {
  return GoRouter(
      navigatorKey: rootNavigator,
      initialLocation: '/login',
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: '/login',
          name: AppRoutes.login.name,
          builder: (context, state) {
            return LoginScreen(
              key: state.pageKey,
            );
          },
        ),
        GoRoute(
          path: '/register',
          name: AppRoutes.register.name,
          builder: (context, state) {
            return RegisterScreen(
              key: state.pageKey,
            );
          },
        ),
        GoRoute(
          path: '/home',
          name: AppRoutes.home.name,
          builder: (context, state) {
            return HomeScreen(
              key: state.pageKey,
            );
          },
        ),
        GoRoute(
          path: '/home2',
          name: AppRoutes.home2.name,
          builder: (context, state) {
            return HomeScreen2(
              key: state.pageKey,
            );
          },
        )
      ]);
});
