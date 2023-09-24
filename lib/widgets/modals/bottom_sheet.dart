import 'package:flutter/material.dart';
import 'package:pozik_front/config/layout.dart';

import '../../config/colors.dart';

class ModalBottomSheet extends StatelessWidget {
  final Widget child;
  final double height;

  const ModalBottomSheet({
    super.key,
    required this.child,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(radiusCircular),
          topRight: Radius.circular(radiusCircular),
        ),
        color: primaryLight
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
