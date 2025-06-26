import 'package:flutter/material.dart';
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(seconds: 2), () {
        context.pushRepalceMent(middleWare());
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: ColorApp.grey),
        child: Image.asset(ImageApp.logoGr),
      ),
    );
  }
}
