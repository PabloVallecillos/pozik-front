import 'package:dio/dio.dart';
import 'package:pozik_front/utils/storage/token_storage.dart';

import '../config/endpoints.dart';
import '../utils/info_plus/device.dart';
import '../utils/info_plus/package.dart';
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

  Future<Response<T>> editProfileMetaData<T>(Map<String, dynamic> data) async
  {
    final String platform = getPlatform();
    final Map<String, dynamic> deviceData = <String, dynamic>{

      'platform': platform,
      'front_version': await getVersion(),
      'device': await getDevice(platform: platform),
      'time_zone': getUserTimeZone(),
    };

    return patch(
      endpoints['user']['update'](null),
      <String, dynamic>{...deviceData, ...data},
      Options(
        headers: <String, String>{
          'Authorization': 'Bearer ${await TokenStorage().get()}'
        }
      )
    );
  }
}
