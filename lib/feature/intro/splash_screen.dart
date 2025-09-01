import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:qabilati/core/constants/image_app.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/function/middle_ware.dart';
import 'package:qabilati/core/theme/color_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        List<ConnectivityResult> connectivity,
        Widget child,
      ) {
        final bool connected = !connectivity.contains(ConnectivityResult.none);
        if (connected) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            Future.delayed(Duration(seconds: 2), () {
              context.pushRepalceMent(middleWare());
            });
          });
        }
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: ColorApp.grey),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageApp.logoGr),
                !connected
                    ? Icon(
                      Icons.wifi_off_sharp,
                      color: ColorApp.midnightBlue,
                      size: 30.0,
                    )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
      child: CircularProgressIndicator(),
    );
  }
}
