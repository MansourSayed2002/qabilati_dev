import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';

class CardServicesWidget extends StatelessWidget {
  const CardServicesWidget({
    super.key,
    required this.title,
    required this.iconData,
    required this.coloricon,
    required this.onTap,
  });
  final String title;
  final IconData iconData;
  final Color coloricon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Row(
        children: [
          Icon(iconData, color: coloricon, size: 25.0),
          Gap(10.0.w),
          Text(
            title,
            style: getBodyStyle(fontWeight: FontWeight.w500, fontSize: 18.0.sp,context: context),
          ),
          Spacer(),
          IconButton(
            onPressed: onTap,
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15.0,
              color: ColorApp.greyDa,
            ),
          ),
        ],
      ),
    );
  }
}
