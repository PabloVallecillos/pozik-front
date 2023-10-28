import 'package:flutter/material.dart';

class ScreenArguments {
  GlobalKey<NavigatorState>? navigatorKey;
  dynamic payload;
  dynamic routeName;

  ScreenArguments({
    this.navigatorKey,
    this.payload,
    this.routeName
  });
}
