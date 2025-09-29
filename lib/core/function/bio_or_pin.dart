import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/theme/color_app.dart';

bioOrPin(
  context, {
  required VoidCallback onTapbio,
  required VoidCallback onTapPin,
}) {
  showDialog(
    context: context,
    builder:
        (context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.fingerprint,
                  size: 70.0,
                  color: ColorApp.coral,
                ),
                onPressed: onTapbio,
              ),
              Gap(30.0.h),
              IconButton(
                icon: Icon(Icons.pin, size: 70.0, color: ColorApp.peach),
                onPressed: onTapPin,
              ),
            ],
          ),
        ),
  );
}
