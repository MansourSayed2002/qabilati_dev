import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';

class LocalAuthanticationApp {
  static LocalAuthentication auth = LocalAuthentication();

  static checkBiometric() async {
    return await auth.canCheckBiometrics;
  }

  static localauthfinger() async {
    try {
      bool canAuthBiometrics = await checkBiometric();
      if (canAuthBiometrics) {
        bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Please authenticate to show account balance',
          options: AuthenticationOptions(biometricOnly: true),
        );
        return didAuthenticate;
      } else {
        return canAuthBiometrics;
      }
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
      } else if (e.code == auth_error.lockedOut ||
          e.code == auth_error.permanentlyLockedOut) {
      } else {
        print(e.toString());
      }
    }
  }
}
