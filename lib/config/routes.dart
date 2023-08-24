import 'package:flutter/material.dart';

import '../screens/screens.dart';

const String welcomeRoute = '/welcome';
const String dashboardRoute = '/dashboard';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  welcomeRoute: (BuildContext context) => const WelcomeScreen(),
  dashboardRoute: (BuildContext context) => const DashboardScreen(),
};
