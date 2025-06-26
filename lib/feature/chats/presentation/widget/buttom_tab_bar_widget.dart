import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';

class ButtomTabBarWidget extends StatelessWidget {
  const ButtomTabBarWidget({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.title,
    required this.onTap,
  });

  final int index;
  final int currentIndex;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40.0.h,
          width: 40.0.w,
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 10.0.w),
          decoration: BoxDecoration(
            color: index == currentIndex ? ColorApp.coral : Colors.white,
            borderRadius:
                index == 0
                    ? BorderRadius.only(
                      topRight: Radius.circular(5.0.r),
                      bottomRight: Radius.circular(5.0.r),
                    )
                    : BorderRadius.only(
                      topLeft: Radius.circular(5.0.r),
                      bottomLeft: Radius.circular(5.0.r),
                    ),
          ),
          child: Text(
            title,
            style: getSmallStyle(
              color: index == currentIndex ? ColorApp.white : ColorApp.black,
            ),
          ),
        ),
      ),
    );
  }
}
