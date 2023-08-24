import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

String getPlatform() => Platform.isIOS
  ? 'ios'
  : Platform.isAndroid
    ? 'android'
    : 'unknown';

Future<String> getDevice({String? platform}) async
{
  platform ??= getPlatform();
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String model = 'unknown';
  switch(platform) {
    case 'android':
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      model = androidInfo.model;
      break;
    case 'ios':
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      model = iosInfo.utsname.machine;
      break;
  }
  return model;
}
