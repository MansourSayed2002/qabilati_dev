import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';

class ButtomRequestFriend extends StatelessWidget {
  const ButtomRequestFriend({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 6.0.w, vertical: 6.0.h),
        padding: EdgeInsets.symmetric(horizontal: 6.0.w, vertical: 10.0.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5.0.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: ColorApp.white),
            Gap(7.0.w),
            Text(
              title,
              style: getBodyStyle(
                color: Colors.white,
                fontSize: 16.0.sp,
                context: context,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
