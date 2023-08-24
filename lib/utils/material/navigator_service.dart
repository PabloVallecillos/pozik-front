import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final Map<String, GlobalKey<NavigatorState>> dashboardNavigatorKeys = <String, GlobalKey<NavigatorState>>{
  // homeRoute: GlobalKey<NavigatorState>(),
  // dashboardRoute + baseClubRoute + listClubRoute: GlobalKey<NavigatorState>(),
  // dashboardRoute + baseMatchRoute + listMatchRoute: GlobalKey<NavigatorState>(),
  // dashboardRoute + baseUserRoute + editProfileRoute: GlobalKey<NavigatorState>(),
  // dashboardRoute + baseUserRoute + calendarRoute: GlobalKey<NavigatorState>(),
  // dashboardRoute + baseUserRoute + pendingNotificationsRoute: GlobalKey<NavigatorState>(),
  // dashboardRoute + baseUserRoute + statisticUserRoute: GlobalKey<NavigatorState>(),
};
