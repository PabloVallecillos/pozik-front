import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pozik_front/config/router.dart';

import '../../config/colors.dart';
import '../../config/images.dart';

class UserDashboardScreen extends StatefulWidget {
  const UserDashboardScreen({super.key});

  @override
  State<UserDashboardScreen> createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryLight,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        children: <Widget>[
          const SizedBox(height: 20,),
          Text(
            'Evalúate Con Los Tests De Pozik',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
              fontWeight: FontWeight.w500
            )
          ),
          const SizedBox(height: 40,),
          InkWell(
            borderRadius: BorderRadius.circular(10.0),
            onTap: () {
              context.pushNamed(personalityFormRoute);
            },
            child: Card(
              child: Column(
                children: <Widget>[
                  Transform.translate(
                    offset: const Offset(0, -20),
                    child: Hero(
                      tag: 'hero$personalityImg',
                      child: SvgPicture.asset(
                        personalityImg,
                        width: 150,
                      ),
                    ),
                  ),
                  Text('Personalidad', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black
                  ),),
                  const SizedBox(height: 20,)
                ],
              ),
            ),
          ),
          const SizedBox(height: 40,),
          InkWell(
            onTap: () {
              context.pushNamed(mentalHealthFormRoute);
            },
            child: Card(
              child: Column(
                children: <Widget>[
                  Transform.translate(
                    offset: const Offset(0, -20),
                    child: Hero(
                      tag: 'hero$mentalHealthImg',
                      child: SvgPicture.asset(
                        mentalHealthImg,
                        width: 180,
                      ),
                    ),
                  ),
                  Text(
                    'Salud Mental',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500
                    )
                  ),
                  const SizedBox(height: 20,)
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            'Mis últimos análisis',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
              fontWeight: FontWeight.w500
            )
          ),
          const SizedBox(height: 20,),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Chip(
                    elevation: 1,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    label: Text(
                      'Personalidad',
                      style: GoogleFonts.montserrat(
                        color: primary,
                        fontSize: Theme.of(context).textTheme.labelSmall?.fontSize,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ),
                  Text(
                    '10/12/1999',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: Theme.of(context).textTheme.labelSmall?.fontSize,
                      fontWeight: FontWeight.w600
                    )
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Chip(
                    elevation: 1,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    label: Text(
                      'Salud mental',
                      style: GoogleFonts.montserrat(
                        color: primary,
                        fontSize: Theme.of(context).textTheme.labelSmall?.fontSize,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ),
                  Text(
                    '10/12/1999',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: Theme.of(context).textTheme.labelSmall?.fontSize,
                      fontWeight: FontWeight.w600
                    )
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}
