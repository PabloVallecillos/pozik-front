import 'package:dio/dio.dart';

import '../config/endpoints.dart';
import 'repository.dart';

class UserRepository extends Repository
{
  Future<Response<T>> login<T>(Map<String, String> data) async
  {
    return post(endpoints['user']['login'], data);
  }

  Future<Response<T>> logout<T>(Map<String, String> data) async
  {
    return get(endpoints['user']['logout']);
  }

  Future<Response<T>> register<T>(Map<String, String> data) async
  {
    return post(endpoints['user']['register'], data);
  }
}
