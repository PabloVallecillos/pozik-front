import 'package:flutter/material.dart';
import 'package:pozik_front/screens/user/form.dart';
import '../screens/screens.dart';

const String welcomeRoute = '/welcome';
const String dashboardRoute = '/dashboard';
const String myPsychologistRoute = '/my-psychologist';
const String formRoute = '/form';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  welcomeRoute: (BuildContext context) => const WelcomeScreen(),
  dashboardRoute: (BuildContext context) => const DashboardScreen(),
  myPsychologistRoute: (BuildContext context) => const MyPsychologistScreen(),
  formRoute: (BuildContext context) => const FormScreen(),
};
