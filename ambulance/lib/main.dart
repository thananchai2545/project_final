import 'package:ambulance/accident_detail.dart';
import 'package:ambulance/exacerbation_detail.dart';
import 'package:ambulance/home.dart';
import 'package:ambulance/infectious_detail.dart';
import 'package:ambulance/layout/layout.dart';
import 'package:ambulance/login.dart';
import 'package:ambulance/non_emergency_detail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'constant/token_maneger.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return Home();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'exacerbation_detail/:id',
            builder: (BuildContext context, GoRouterState state) {
              String id = state.extra.toString();
              return ExacerbationDetail(id: id);
            },
          ),
          GoRoute(
            path: 'non_emergency_detail/:id',
            builder: (BuildContext context, GoRouterState state) {
              String id = state.extra.toString();
              return NonEmergencyDetail(id: id);
            },
          ),
          GoRoute(
            path: 'infectious_detail/:id',
            builder: (BuildContext context, GoRouterState state) {
              String id = state.extra.toString();
              return InfectiousDetail(id: id);
            },
          ),
          GoRoute(
            path: 'accident_detail/:id',
            builder: (BuildContext context, GoRouterState state) {
              String id = state.extra.toString();
              return Accident(id: id);
            },
          ),
          GoRoute(
            path: 'login',
            builder: (BuildContext context, GoRouterState state) {
              return const Login();
            },
          ),
        ],
      ),
    ],
    redirect: (context, state) async {
      final isValid = await AuthService().validateNavigationToProtectedRoute();
      final loggingIn = state.matchedLocation == '/login' ||
          state.matchedLocation == '/register';
      if (isValid) {
        return null;
      } else if (!isValid && !loggingIn) {
        await AuthService().clearToken();
        return '/login';
      }
      return null;
    });

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
