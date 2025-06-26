import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/theme/color_app.dart';

getTitleStyle({
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  required BuildContext context,
}) => TextStyle(
  fontSize: fontSize ?? 24.0.sp,
  fontWeight: fontWeight ?? FontWeight.bold,
  color: color ?? Theme.of(context).appBarTheme.titleTextStyle?.color,
);

getBodyStyle({
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  required BuildContext context,
}) => TextStyle(
  fontSize: fontSize ?? 20.0.sp,
  fontWeight: fontWeight ?? FontWeight.bold,
  color: color ?? Theme.of(context).appBarTheme.titleTextStyle?.color,
);

getSmallStyle({
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
  double? height,
}) => TextStyle(
  fontSize: fontSize ?? 12.0.sp,
  fontWeight: fontWeight ?? FontWeight.w400,
  color: color ?? ColorApp.greyDark,
  height: height,
);
