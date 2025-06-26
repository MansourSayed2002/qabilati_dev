import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/constants/image_app.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/shared/elevated_button_widget.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/feature/auth/presentation/screen/login_screen.dart';
import 'package:qabilati/generated/l10n.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              ImageApp.frameOne,
              width: double.infinity,
              height: 380.h,
              fit: BoxFit.fill,
            ),
            Gap(20.0.h),
            Image.asset(ImageApp.logoCir, width: 70.0.w),
            Text(S.of(context).welcome, style: getTitleStyle(context: context)),
            Gap(10.0.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.0.w),
              child: Column(
                children: [
                  Text(
                    S.of(context).welcome_body,
                    style: getSmallStyle(fontSize: 12.0.sp),
                    textAlign: TextAlign.center,
                  ),
                  Gap(20.0.h),
                  ElevatedButtonWidget(
                    title: S.of(context).Get_started,
                    onTap: () {
                      LocalStorageApp.saveData("step", "1");
                      context.push(LoginScreen());
                    },
                  ),
                  Gap(50.0.h),
                  Text(
                    S.of(context).welcome_subtile,
                    style: getSmallStyle(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
