import 'package:package_info_plus/package_info_plus.dart';

Future<String> getVersion() async
{
  final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return '${packageInfo.buildNumber} (${packageInfo.version})';
}
