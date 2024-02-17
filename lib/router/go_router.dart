import 'package:delivery_app/features/dashboard/view/cart/cart.dart';
import 'package:delivery_app/features/dashboard/view/dashboard.dart';
import 'package:delivery_app/features/dashboard/home/home.dart';
import 'package:delivery_app/features/dashboard/home/home2.dart';
import 'package:delivery_app/features/dashboard/view/discover/discover.dart';
import 'package:delivery_app/features/dashboard/view/homepage/homepage.dart';
import 'package:delivery_app/features/dashboard/view/homepage/pages/payment.dart';
import 'package:delivery_app/features/dashboard/view/homepage/pages/succes.dart';
import 'package:delivery_app/features/dashboard/view/profile/profile.dart';
import 'package:delivery_app/features/dashboard/view/search/search.dart';
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
  dashboard,
  homepage,
  payments,
  success,
  discover,
  cart,
  search,
  profile,
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
        ),
        // GoRoute(
        //   path: '/details',
        //   name: AppRoutes.details.name,
        //   builder: (context, state) {
        //     return DetailsPage(key: state.pageKey, menu: menu);
        //   },
        // )
        GoRoute(
            path: '/dashboard',
            name: AppRoutes.dashboard.name,
            builder: (context, state) {
              return DashBoardPage(
                key: state.pageKey,
              );
            },
            routes: [
              GoRoute(
                path: 'homepage',
                name: AppRoutes.homepage.name,
                builder: (context, state) {
                  return HomePage(
                    key: state.pageKey,
                  );
                },
              ),
              GoRoute(
                path: 'discover',
                name: AppRoutes.discover.name,
                builder: (context, state) {
                  return DiscoverPage(
                    key: state.pageKey,
                  );
                },
              ),
              GoRoute(
                path: 'cart',
                name: AppRoutes.cart.name,
                builder: (context, state) {
                  return CartPage(
                    key: state.pageKey,
                  );
                },
              ),
              GoRoute(
                path: 'search',
                name: AppRoutes.search.name,
                builder: (context, state) {
                  return SearchPage(
                    key: state.pageKey,
                  );
                },
              ),
              GoRoute(
                path: 'profile',
                name: AppRoutes.profile.name,
                builder: (context, state) {
                  return ProfilePage(
                    key: state.pageKey,
                  );
                },
              )
            ]),
        GoRoute(
          path: '/payments',
          name: AppRoutes.payments.name,
          builder: (context, state) {
            return PaymentPage(
              key: state.pageKey,
            );
          },
        ),
        GoRoute(
          path: '/success',
          name: AppRoutes.success.name,
          builder: (context, state) {
            return SuccessPage(
              key: state.pageKey,
            );
          },
        )
      ]);
});
