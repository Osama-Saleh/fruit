import 'package:flutter_secure_storage/flutter_secure_storage.dart';

 class SecureStorage {
  SecureStorage._();

  static final SecureStorage instance = SecureStorage._();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  Map<String, String> _cache = {};

  Future<void> init() async {
    _cache = await _storage.readAll();
  }

  // Synchronous read from cache
  String? getString({required String key}) {
    return _cache[key];
  }

  // Write
  Future<void> write({
    required String key,
    required String value,
  }) async {
    _cache[key] = value;
    await _storage.write(
      key: key,
      value: value,
    );
  }

  // Read
  Future<String?> read({
    required String key,
  }) async {
    return _cache[key] ?? await _storage.read(key: key);
  }

  // Delete
  Future<void> delete({
    required String key,
  }) async {
    _cache.remove(key);
    await _storage.delete(key: key);
  }

  // Delete All
  Future<void> deleteAll() async {
    _cache.clear();
    await _storage.deleteAll();
  }

  // Check if key exists
  Future<bool> containsKey({
    required String key,
  }) async {
    return _cache.containsKey(key) || await _storage.containsKey(key: key);
  }
}