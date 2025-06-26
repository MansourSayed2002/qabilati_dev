import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/class/messageing_config.dart';
import 'package:qabilati/core/class/zego_kit.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/feature/auth/data/model/user_model.dart';
import 'package:qabilati/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ServiceApp {
  static Future<void> init(GlobalKey<NavigatorState> navigatorKeydev) async {
    await Hive.initFlutter();
    await Hive.openBox("userbox");
    Hive.registerAdapter(UserModelAdapter());
    await LocalStorageApp.initStorage();
    await dotenv.load(fileName: ".env");
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL'].toString(),
      anonKey: dotenv.env['SUPABASE_ANON_KEY'].toString(),
    );
    await MessageingConfig.initFirebaseMessaging();
    setUp();
    if (LocalStorageApp.getHiveData("user_data") != null) {
      ZegoKit.instance.onUserLogin(
        userID: LocalStorageApp.getHiveData("user_data")['user_id'].toString(),
        userName:
            LocalStorageApp.getHiveData("user_data")['user_name'].toString(),
      );
    } else {
      LocalStorageApp.saveData("initzego", false);
    }
  }
}
