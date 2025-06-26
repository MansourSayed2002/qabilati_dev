import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';

class CustomBottomWidget extends StatelessWidget {
  const CustomBottomWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.colorbutton,
  });
  final String title;
  final VoidCallback onTap;
  final Color? colorbutton;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0.h),
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 6.0.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0.r),
          color: colorbutton ?? Colors.green,
        ),
        child: Text(
          title,
          style: getSmallStyle(
            fontSize: 18.0.sp,
            color: ColorApp.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
