import 'package:flutter/material.dart';

abstract class AbstractProvider extends ChangeNotifier {
  void convertType(List<dynamic> list, List<dynamic> iterate) {
    list.clear();
    for (final dynamic item in iterate) {
      list.add(item);
    }
  }

  dynamic toMap() {}

  dynamic get(String propertyName) => toMap()[propertyName];
}
