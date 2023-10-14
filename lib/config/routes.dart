import 'package:flutter/material.dart';
import '../screens/screens.dart';

const String welcomeRoute = '/welcome';
const String dashboardRoute = '/dashboard';
const String myPsychologistRoute = '/my-psychologist';
const String formRoute = '/form';
const String mentalHealth = '/mental-health';
const String personality = '/personality';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  welcomeRoute: (BuildContext context) => const WelcomeScreen(),
  dashboardRoute: (BuildContext context) => const DashboardScreen(),
  myPsychologistRoute: (BuildContext context) => const MyPsychologistScreen(),
  formRoute + personality: (BuildContext context) => const PersonalityScreen(),
  formRoute + mentalHealth: (BuildContext context) => const MentalHealthScreen(),
};
