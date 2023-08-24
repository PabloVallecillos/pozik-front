import 'package:flutter/material.dart';
import 'package:pozik_front/config/colors.dart';

final GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

enum Position { up, down }

Future<void>? showSnackBar(
  String msg,
  {
    Color backgroundColor = Colors.white,
    Color textColor = primary,
    int? seconds,
    Position position = Position.down,
    BuildContext? context,
  }
) {
  if (position == Position.up) {
    if (context == null) {
      throw ArgumentError('Context is required for Up position');
    }
  }
  final bool isUpPosition = position == Position.up;
  return messengerKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(msg, style: TextStyle(color: textColor)),
      backgroundColor: backgroundColor,
      duration: Duration(seconds: seconds ?? 5),
      dismissDirection: isUpPosition ? DismissDirection.up : DismissDirection.down,
      margin: isUpPosition
        ? EdgeInsets.only(
          bottom: MediaQuery.of(context!).size.height - 100,
          right: 8,
          left: 8,
        )
        : const EdgeInsets.all(8),
    ),
  ).closed.then((SnackBarClosedReason value) => messengerKey.currentState?.clearSnackBars());
}
