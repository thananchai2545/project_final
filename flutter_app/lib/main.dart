import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Special_patients.dart';
import 'package:flutter_app/accident.dart';
import 'package:flutter_app/accident_contact.dart';
import 'package:flutter_app/accident_image.dart';
import 'package:flutter_app/accident_map.dart';
// import 'package:flutter_app/accident_map.dart';
import 'package:flutter_app/buttom_layout.dart';
import 'package:flutter_app/constant/config.dart';
import 'package:flutter_app/constant/token_manager.dart';
import 'package:flutter_app/emergency_patient.dart';

import 'package:flutter_app/profile.dart';
// import 'package:flutter_app/home_page.dart';
import 'package:flutter_app/register.dart';
import 'package:flutter_app/test.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_app/login_page.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';

void main() {
  // Intl.defaultLocale = 'th';
  // initializeDateFormatting();
  runApp(MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const ButtomLayout();
        },
        routes: <RouteBase>[
          GoRoute(
              path: 'emergencypatient',
              builder: (BuildContext context, GoRouterState state) {
                return const EmergencyPatient();
              }),
          GoRoute(
            path: 'specialpatients',
            builder: (BuildContext context, GoRouterState state) {
              return const SpecialPatients();
            },
          ),
          GoRoute(
              path: 'accident',
              builder: (BuildContext context, GoRouterState state) {
                return const Accident();
              },
              routes: <RouteBase>[
                GoRoute(
                    path: 'accident_map',
                    builder: (context, state) {
                      List data_patient = state.extra as List;
                      // AccidentData accidentData = state.extra as AccidentData;
                      return AccidentMap(
                        data_patient: data_patient,
                        // accidentData: accidentData,
                      );
                    },
                    routes: <RouteBase>[
                      GoRoute(
                          path: 'accident_contact',
                          builder: (context, state) {
                            List data_patient = state.extra as List;
                            return AccidentContact(
                              data_patient: data_patient,
                              // data_patient: data_patient,
                            );
                          },
                          routes: <RouteBase>[
                            GoRoute(
                              path: 'accident_image',
                              builder: (context, state) {
                                // String data = state.extra.toString();
                                List data_patient = state.extra as List;
                                return AccidentImage(
                                  data_patient: data_patient,
                                );
                              },
                            )
                          ])
                    ])
              ]),
        ]),
    GoRoute(
      path: '/profile',
      builder: (BuildContext context, GoRouterState state) {
        return const Profile();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) {
        return const Register();
      },
    )
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
    // });

    // if(isValid)
    // final loggingIn = state.matchedLocation == '/login' ||
    //     state.matchedLocation == '/register';
    // if (!isValid && !loggingIn) {
    //   await AuthService().clearToken();
    //   context.push('/login');
    // } else {
    //   context.push('/');
    // }
    // return null;
    // final String? token = await AuthService().loadToken();
    // final response = http.get(
    //   Uri.parse('${Config.API_URL}/api-app/member/validate'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //     'Authorization': 'Bearer $token',
    //   },
    // );

    // final response = await http.get(
    //   Uri.parse('${Config.API_URL}/api-app/member/validate'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //     'Authorization': 'Bearer $token',
    //   },
    // );

    // print(jsonDecode(response.body));
    // if (response.statusCode == 200) {
    //   print('object');
    // }
  },
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );

    // return MaterialApp(
    //   home: Test(),
    // );
  }
}
