import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';

class CustomTextFormGlobal extends StatelessWidget {
  const CustomTextFormGlobal({
    super.key,
    required this.hinttext,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.obscureText,
    this.onChanged,
    this.prefixIcon,
    this.height,
    this.readOnly,
    this.maxLines,
    this.onTap,
    this.focusNode,
  });
  final String hinttext;
  final double? height;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool? obscureText;
  final bool? readOnly;
  final int? maxLines;
  final FocusNode? focusNode;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      controller: controller,
      focusNode: focusNode,
      onTap: onTap,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines,
      obscureText: obscureText ?? false,
      cursorColor: ColorApp.coral,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: ColorApp.grey,
        hintText: hinttext,
        hintTextDirection:
            LocalStorageApp.getData("local") == "en"
                ? TextDirection.ltr
                : TextDirection.rtl,
        hintStyle: getSmallStyle(fontSize: 14.0.sp),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0.r),
          borderSide: BorderSide(color: ColorApp.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0.r),
          borderSide: BorderSide(color: ColorApp.grey),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0.r),
          borderSide: BorderSide(color: ColorApp.grey),
        ),
      ),
    );
  }
}
