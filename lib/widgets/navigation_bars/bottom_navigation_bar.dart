import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/colors.dart';
import '../../config/router.dart';

class PozikBottomNavigationBar extends StatefulWidget {
  const PozikBottomNavigationBar({super.key});

  @override
  State<PozikBottomNavigationBar> createState() => _PozikBottomNavigationBarState();
}

class _PozikBottomNavigationBarState extends State<PozikBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: kBottomNavigationBarHeight,
      selectedIndex: _selectedIndex,
      onDestinationSelected: (int index) {
        final List<String> locations = [
          dashboardRoute,
          myAnalysisRoute,
          myPsychologistRoute
        ];
        context.goNamed(locations[index]);
        setState(() {
          _selectedIndex = index;
        });
      },
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined, color: primary,),
          label: 'Explore',
          tooltip: 'home',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.bar_chart),
          icon: Icon(Icons.bar_chart_outlined, color: primary,),
          label: 'Commute',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.person_search),
          icon: Icon(Icons.person_search_outlined, color: primary,),
          label: 'Saved',
        ),
      ],
    );
  }
}
