import 'package:dio/dio.dart';

import '../utils/http/dio.dart';

class Repository
{
  final DioClient _dio;

  Repository() : _dio = DioClient();

  Future<Response<T>> get<T>(String path) async
  {
    return _dio.client.get(path);
  }

  Future<Response<T>> post<T>(String path, Map<String, dynamic> data) async
  {
    return _dio.client.post(path, data: data);
  }

  Future<Response<T>> patch<T>(String path, Map<String, dynamic> data, Options options) async
  {
    return _dio.client.patch(path, data: data, options: options);
  }
}
