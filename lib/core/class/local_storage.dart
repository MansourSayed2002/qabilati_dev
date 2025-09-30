import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:qabilati/feature/auth/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageApp {
  static late SharedPreferences sharedPreferences;
  static late Box<UserModel> userBox;
  static late FlutterSecureStorage storage;

  static String uuidUser = "user_uuid";
  static String userData = "user_data";

  static initStorage() async {
    sharedPreferences = await SharedPreferences.getInstance();
    userBox = await Hive.openBox<UserModel>("userbox");
    storage = FlutterSecureStorage();
  }

  static setSecureStorage(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  static getSecureStorage(String key) async => await storage.read(key: key);

  static setHiveData(String key, dynamic value) {
    userBox.put(key, value);
  }

  static getHiveData(String key) => userBox.get(key);

  static saveData(String key, dynamic value) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
  }

  static getData(String key) => sharedPreferences.get(key);

  static clearStorage() async {
    await sharedPreferences.clear();
    await userBox.clear();
    await userBox.compact();
    await storage.deleteAll();
    await saveData('step', "1");
  }
}
