import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:sentry_dio/sentry_dio.dart';

import '../../config/env.dart';

class DioClient
{
  final Dio client = Dio();

  DioClient() {
    client.options.baseUrl = apiBaseUrl;
    client.options.connectTimeout = const Duration(seconds: 5);
    client.options.receiveTimeout = const Duration(seconds: 3);
    client.options.headers = <String, String>{
      Headers.acceptHeader: Headers.jsonContentType,
      Headers.contentTypeHeader: Headers.jsonContentType
    };
    client.addSentry();
  }

  static String getResponseErrors(Map<String, dynamic> res)
  {
    final List<String> messages = <String>[];
    final Map<String, List<dynamic>> errors = Map<String, List<dynamic>>.from(res["errors"]);
    errors.forEach((String key, List<dynamic> value) {
      value.forEach((dynamic msg) => messages.add('• $msg'));
    });
    return messages.join('\n');
  }
}
