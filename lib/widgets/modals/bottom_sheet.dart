import 'package:flutter/material.dart';

import '../../utils/material/gradient.dart';
import '../containers/glass_morphism.dart';

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
    return GlassmorphicContainer(
      width: double.infinity,
      height: height,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
      blur: 6,
      border: 0,
      alignment: Alignment.center,
      linearGradient: linearGradient(),
      borderGradient: borderGradient(),
      child: child,
    );
  }
}
