import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/material/gradient.dart';
import '../containers/glass_morphism.dart';

class GlassmorphismButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final dynamic text;

  const GlassmorphismButton({
    super.key,
    required this.onPressed,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: MediaQuery.of(context).size.width,
      height: 50,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      blur: 3,
      border: 0,
      alignment: Alignment.center,
      linearGradient: linearGradient(),
      borderGradient: borderGradient(),
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: onPressed,
        child: text is Widget
          ? text
          : Text(
            text,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
      ),
    );
  }
}
