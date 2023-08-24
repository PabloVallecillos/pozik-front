import 'storage.dart';

class TokenStorage extends Storage
{
  static const String _apiToken = 'authToken';

  Future<String?> get() async => await read(_apiToken);

  Future<void> set(String token) => write(_apiToken, token);
}
