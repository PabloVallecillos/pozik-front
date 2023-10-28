import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../screens/custom_transition_page.dart';
import '../screens/screens.dart';
import '../utils/material/navigator_service.dart';
import '../widgets/app_bars/app_bar.dart';
import '../widgets/navigation_bars/bottom_navigation_bar.dart';

const String welcomeRoute = 'welcome';
const String dashboardRoute = 'dashboard';
const String myPsychologistRoute = 'my-psychologist';
const String myAnalysisRoute = 'my-analysis';
const String formRoute = 'form';
const String mentalHealthFormRoute = 'mental-health';
const String personalityFormRoute = 'personality';

final GoRouter router = GoRouter(
  initialLocation: '/$welcomeRoute',
  navigatorKey: rootNavigatorKey,
  // redirect: (BuildContext context, GoRouterState state) {
  //   if (!context.read<UserProvider>().isSignedIn()) {
  //     return '/$welcomeRoute';
  //   }
  // },
  errorPageBuilder: (BuildContext context, GoRouterState state) => PozikCustomTransitionPage(
    key: state.pageKey,
    child: Container(color: Colors.red,),
  ),
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      name: welcomeRoute,
      path: '/$welcomeRoute',
      pageBuilder: (BuildContext context, GoRouterState state) => PozikCustomTransitionPage(
        key: state.pageKey,
        child: const WelcomeScreen(),
      ),
    ),
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return Scaffold(
          appBar: const PozikAppBar(),
          body: child,
          bottomNavigationBar: const PozikBottomNavigationBar(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          name: dashboardRoute,
          path: '/$dashboardRoute',
          pageBuilder: (BuildContext context, GoRouterState state) => PozikCustomTransitionPage(
            key: state.pageKey,
            child: const UserDashboardScreen(),
          ),
          routes: <RouteBase>[
            GoRoute(
              name: personalityFormRoute,
              path: personalityFormRoute,
              parentNavigatorKey: rootNavigatorKey,
              pageBuilder: (BuildContext context, GoRouterState state) => PozikCustomTransitionPage(
                key: state.pageKey,
                child: const PersonalityFormScreen(),
              ),
            ),
            GoRoute(
              name: mentalHealthFormRoute,
              path: mentalHealthFormRoute,
              parentNavigatorKey: rootNavigatorKey,
              pageBuilder: (BuildContext context, GoRouterState state) => PozikCustomTransitionPage(
                key: state.pageKey,
                child: const MentalHealthFormScreen(),
              ),
            ),
          ]
        ),
        GoRoute(
          name: myAnalysisRoute,
          path: '/$myAnalysisRoute',
          pageBuilder: (BuildContext context, GoRouterState state) => PozikCustomTransitionPage(
            key: state.pageKey,
            child: Container(color: Colors.blue,),
          ),
        ),
        GoRoute(
          name: myPsychologistRoute,
          path: '/$myPsychologistRoute',
          builder: (BuildContext context, GoRouterState state) => const MyPsychologistScreen(),
          pageBuilder: (BuildContext context, GoRouterState state) => PozikCustomTransitionPage(
            key: state.pageKey,
            child: const MyPsychologistScreen(),
          ),
        ),
      ],
    ),
  ],
);
