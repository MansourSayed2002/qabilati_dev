import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/theme/color_app.dart';

congratulationWidget(context) {
  return showDialog(
    context: context,
    builder:
        (context) => Center(
          child: Container(
            width: 100.0.w,
            height: 100.0.h,
            padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0.r),
              color: ColorApp.black,
            ),
            child: Icon(Icons.done_outline, color: Colors.green, size: 100.0),
          ),
        ),
  );
}
