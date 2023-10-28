import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colors.dart';
import '../../config/icons.dart';

class PozikAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PozikAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Pozik', style: GoogleFonts.montserrat(
        color: primary,
        fontWeight: FontWeight.w600,
      )),
      leading: Padding(
        padding: const EdgeInsets.only(left: 32.5),
        child: SvgPicture.asset(
          logoIcon,
          colorFilter: const ColorFilter.mode(primary, BlendMode.srcIn),
        ),
      ),
      backgroundColor: primary.withOpacity(.1),
      titleSpacing: 4,
      leadingWidth: 65,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 32.5),
          child: CircleAvatar(
            backgroundColor: primary,
            child: Text('P', style: GoogleFonts.montserrat(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            )),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
