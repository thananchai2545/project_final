import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Exacerbation.dart';
import 'package:flutter_app/Exacerbation_contact.dart';
import 'package:flutter_app/Exacerbation_event.dart';
import 'package:flutter_app/Exacerbation_map.dart';
import 'package:flutter_app/Infectious_patients.dart';
import 'package:flutter_app/Infectious_patients_diagnose.dart';
import 'package:flutter_app/Infectious_patients_map_.dart';
import 'package:flutter_app/Infectious_patients_travel.dart';
import 'package:flutter_app/Non_emergency_patients.dart';
import 'package:flutter_app/Non_emergency_patients_appointment%20.dart';
import 'package:flutter_app/Non_emergency_patients_destination.dart';
import 'package:flutter_app/Non_emergency_patients_health.dart';
import 'package:flutter_app/Semi_emergency.dart';
import 'package:flutter_app/accident.dart';
import 'package:flutter_app/accident_contact.dart';
import 'package:flutter_app/accident_image.dart';
import 'package:flutter_app/accident_map.dart';
// import 'package:flutter_app/accident_map.dart';
import 'package:flutter_app/buttom_layout.dart';
import 'package:flutter_app/constant/config.dart';
import 'package:flutter_app/constant/token_manager.dart';
import 'package:flutter_app/emergency_patient.dart';
import 'package:flutter_app/map_screen.dart';

import 'package:flutter_app/profile.dart';
// import 'package:flutter_app/home_page.dart';
import 'package:flutter_app/register.dart';
import 'package:flutter_app/test.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_app/login_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
            path: 'map_screen',
            builder: (BuildContext context, GoRouterState state) {
              Map<String, dynamic> dataPatient =
                  state.extra as Map<String, dynamic>;
              return MapScreen(dataPatient: dataPatient);
            },
          ),
          GoRoute(
            path: 'test',
            builder: (BuildContext context, GoRouterState state) {
              LatLng? draggedPosition = state.extra as LatLng?;
              return Test(draggedPosition: draggedPosition);
            },
          ),
          GoRoute(
              path: 'emergencypatient',
              builder: (BuildContext context, GoRouterState state) {
                return const EmergencyPatient();
              },
              routes: <RouteBase>[
                GoRoute(
                    path: 'accident',
                    builder: (BuildContext context, GoRouterState state) {
                      return const Accident();
                    },
                    routes: <RouteBase>[
                      GoRoute(
                          path: 'accident_map',
                          builder: (context, state) {
                            Map<String, dynamic>? dataPatient =
                                state.extra as Map<String, dynamic>;
                            // LatLng? draggedPosition = state.extra as LatLng?;

                            // AccidentData accidentData = state.extra as AccidentData;
                            return AccidentMap(
                              dataPatient: dataPatient,
                              // draggedPosition: draggedPosition
                              // accidentData: accidentData,
                            );
                          },
                          routes: <RouteBase>[
                            GoRoute(
                                path: 'accident_contact',
                                builder: (context, state) {
                                  Map<String, dynamic> dataPatient =
                                      state.extra as Map<String, dynamic>;
                                  return AccidentContact(
                                    dataPatient: dataPatient,
                                    // data_patient: data_patient,
                                  );
                                },
                                routes: <RouteBase>[
                                  GoRoute(
                                    path: 'accident_image',
                                    builder: (context, state) {
                                      // String data = state.extra.toString();
                                      Map<String, dynamic> data_patient =
                                          state.extra as Map<String, dynamic>;
                                      return AccidentImage(
                                        data_patient: data_patient,
                                      );
                                    },
                                  )
                                ])
                          ])
                    ]),
                GoRoute(
                    path: 'exacerbation',
                    builder: (BuildContext context, GoRouterState state) {
                      return const Exacerbation();
                    },
                    routes: <RouteBase>[
                      GoRoute(
                          name: 'event',
                          path: 'event',
                          builder: (BuildContext context, GoRouterState state) {
                            Map<String, dynamic> data =
                                state.extra as Map<String, dynamic>;
                            return ExacerbationEvent(
                              data: data,
                            );
                          },
                          routes: <RouteBase>[
                            GoRoute(
                                path: 'map',
                                builder: (BuildContext context,
                                    GoRouterState state) {
                                  Map<String, dynamic> data =
                                      state.extra as Map<String, dynamic>;
                                  return ExacerbationMap(
                                    data: data,
                                  );
                                },
                                routes: <RouteBase>[
                                  GoRoute(
                                    path: 'contact',
                                    builder: (BuildContext context,
                                        GoRouterState state) {
                                      Map<String, dynamic> data =
                                          state.extra as Map<String, dynamic>;
                                      return ExacerbationContact(
                                        data: data,
                                      );
                                    },
                                  )
                                ])
                          ])
                    ])
              ]),
          GoRoute(
              path: 'non_emergency_patients',
              builder: (BuildContext context, GoRouterState state) {
                return const NonEmergencyPatients();
              },
              routes: <RouteBase>[
                GoRoute(
                    path: 'health',
                    builder: (BuildContext context, GoRouterState state) {
                      Map<String, dynamic> data =
                          state.extra as Map<String, dynamic>;
                      return NonEmergencyPatientsHealth(data: data);
                    },
                    routes: <RouteBase>[
                      GoRoute(
                          path: 'appointment',
                          builder: (BuildContext context, GoRouterState state) {
                            Map<String, dynamic> data =
                                state.extra as Map<String, dynamic>;
                            return NonEmergencyPatientsAppointment(
                              data: data,
                            );
                          },
                          routes: <RouteBase>[
                            GoRoute(
                              path: 'destination',
                              builder:
                                  (BuildContext context, GoRouterState state) {
                                Map<String, dynamic> data =
                                    state.extra as Map<String, dynamic>;
                                return NonEmergencyPatientsDestination(
                                    data: data);
                              },
                            ),
                          ]),
                    ]),
              ]),
          GoRoute(
              path: 'infectiousPatients',
              builder: (BuildContext context, GoRouterState state) {
                return const InfectiousPatients();
              },
              routes: <RouteBase>[
                GoRoute(
                    path: 'map',
                    builder: (BuildContext context, GoRouterState state) {
                      Map<String, dynamic> data =
                          state.extra as Map<String, dynamic>;
                      return InfectiousPatientsMap(
                        data: data,
                      );
                    },
                    routes: <RouteBase>[
                      GoRoute(
                          path: 'diagnose',
                          builder: (BuildContext context, GoRouterState state) {
                            Map<String, dynamic> data =
                                state.extra as Map<String, dynamic>;
                            return InfectiousPatientsDiagnose(data: data);
                          },
                          routes: <RouteBase>[
                            GoRoute(
                              path: 'travel',
                              builder:
                                  (BuildContext context, GoRouterState state) {
                                Map<String, dynamic> data =
                                    state.extra as Map<String, dynamic>;
                                return InfectiousPatientsTravel(data: data);
                              },
                            )
                          ])
                    ])
              ])
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
