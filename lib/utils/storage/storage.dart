import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class Storage
{
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<Map<String, String>> readAll({required String key}) async => _storage.readAll();

  Future<Future<String?>> read(String key) async => _storage.read(key: key);

  Future<void> write(String key, String value) async => _storage.write(key: key, value: value);

  Future<void> delete(String key) async => _storage.delete(key: key);

  Future<void> deleteAll(String key) async => _storage.deleteAll();
}
