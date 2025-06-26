import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class ZegoKit {
  ZegoKit._internal();

  static final ZegoKit instance = ZegoKit._internal();

  void onUserLogin({required String userID, required String userName}) async {
    try {
      await ZegoUIKitPrebuiltCallInvitationService().init(
        appID: int.parse(dotenv.env['APP_ID_ZEGO'].toString()),
        appSign: dotenv.env['APP_SIGN_ZEGO'].toString(),
        userID: userID,
        userName: userName,
        plugins: [ZegoUIKitSignalingPlugin()],
      );
    } catch (e) {
      log(e.toString());
    }
  }

  /// on App's user logout
  void onUserLogout() {
    try {
      ZegoUIKitPrebuiltCallInvitationService().uninit();
    } catch (e) {
      log(e.toString());
    }
  }
}
