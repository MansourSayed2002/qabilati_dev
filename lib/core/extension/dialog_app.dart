import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/constants/image_app.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/generated/l10n.dart';

extension DialogApp on BuildContext {
  dialogApp({
    required String title,
    required String content,
    required VoidCallback onConfirme,
    required VoidCallback onCancel,
  }) {
    return showDialog(
      context: this,
      builder:
          (context) => Container(
            margin: EdgeInsets.symmetric(vertical: 200.0.h, horizontal: 30.0.w),
            decoration: BoxDecoration(
              color: ColorApp.white,
              borderRadius: BorderRadius.circular(20.0.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 100.0.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorApp.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0.r),
                      topRight: Radius.circular(20.0.r),
                    ),
                    image: DecorationImage(
                      image: AssetImage(ImageApp.logo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Gap(10.0.h),
                Text(title, style: getSmallStyle()),
                Gap(10.0.h),
                Gap(10.0.h),
                Text(content, style: getSmallStyle()),
                Gap(10.0.h),
                Row(
                  children: [
                    TextButton(
                      onPressed: onCancel,
                      child: Text(
                        S.of(context).no,
                        style: getBodyStyle(color: ColorApp.red, context: this),
                      ),
                    ),
                    TextButton(
                      onPressed: onConfirme,
                      child: Text(
                        S.of(context).yes,
                        style: getBodyStyle(
                          color: ColorApp.midnightBlue,
                          context: this,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }
}
