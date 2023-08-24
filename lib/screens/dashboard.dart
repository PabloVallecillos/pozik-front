import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pozik_front/config/colors.dart';

import '../config/icons.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pozik', style: GoogleFonts.montserrat(
          color: primary,
          fontWeight: FontWeight.w600,
        )),
        leading: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: SvgPicture.asset(
            logoIcon,
            colorFilter: const ColorFilter.mode(primary, BlendMode.srcIn),
          ),
        ),
        backgroundColor: primary.withOpacity(.1),
        titleSpacing: 4,
        leadingWidth: 50,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: CircleAvatar(
              backgroundColor: primary,
              child: Text('P', style: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              )),
            ),
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        height: kBottomNavigationBarHeight,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('helou', style: TextStyle(color: primary),)
          ],
        ),
      ),
    );
  }
}
