import 'package:flutter_secure_storage/flutter_secure_storage.dart';

 class SecureStorage {
  SecureStorage._();

  static final SecureStorage instance = SecureStorage._();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Write
  Future<void> write({
    required String key,
    required String value,
  }) async {
    await _storage.write(
      key: key,
      value: value,
    );
  }

  // Read
  Future<String?> read({
    required String key,
  }) async {
    return await _storage.read(key: key);
  }

  // Delete
  Future<void> delete({
    required String key,
  }) async {
    await _storage.delete(key: key);
  }

  // Delete All
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  // Check if key exists
  Future<bool> containsKey({
    required String key,
  }) async {
    return await _storage.containsKey(key: key);
  }
}