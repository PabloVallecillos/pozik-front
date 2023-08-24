import 'package:flutter/material.dart';

LinearGradient linearGradient() => LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: <Color>[
    const Color(0xFFffffff).withOpacity(0.1),
    const Color(0xFFFFFFFF).withOpacity(0.05),
  ],
  stops: const <double>[
    0.1,
    1,
  ]
);

LinearGradient borderGradient() => LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: <Color>[
    const Color(0xFFffffff).withOpacity(0.5),
    const Color(0xFFFFFFFF).withOpacity(0.5),
  ],
);
