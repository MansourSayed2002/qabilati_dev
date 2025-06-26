import 'package:flutter/widgets.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/feature/auth/presentation/screen/login_screen.dart';
import 'package:qabilati/feature/intro/onboarding_screen.dart';

import 'package:qabilati/feature/main/screen/main_screen.dart';

Widget middleWare() {
  if (LocalStorageApp.getData("step") == "2") {
    return MainScreen();
  } else if (LocalStorageApp.getData("step") == "1") {
    return LoginScreen();
  } else {
    return OnboardingScreen();
  }
}
