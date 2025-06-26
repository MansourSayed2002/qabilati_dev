import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0.w),
        padding: EdgeInsets.symmetric(vertical: 6.0.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorApp.coral,
          borderRadius: BorderRadius.circular(8.0.r),
        ),
        child: Text(
          title,
          style: getSmallStyle(color: ColorApp.white, fontSize: 18.0.sp),
        ),
      ),
    );
  }
}
