import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final FlutterSecureStorage _flutterSecureStorage;

  CacheHelper()
    : _flutterSecureStorage = FlutterSecureStorage(
        aOptions: _getAndroidOptions(),
      );

  static AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  Future<void> saveData({required String key, required String value}) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }

  Future<String?> readData({required String key}) async {
    return await _flutterSecureStorage.read(key: key);
  }

  Future<void> delete({required String key}) async {
    await _flutterSecureStorage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _flutterSecureStorage.deleteAll();
  }

  Future<void> isFirstInstall() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirst = prefs.getBool("first_install") ?? true;
    if (isFirst) {
      await prefs.setBool("first_install", false);
      await _flutterSecureStorage.deleteAll();
    }
  }
}
