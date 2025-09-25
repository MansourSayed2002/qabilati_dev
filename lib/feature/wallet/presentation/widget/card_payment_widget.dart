import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/theme/color_app.dart';

class CardPaymentWidget extends StatelessWidget {
  const CardPaymentWidget({
    super.key,
    required this.iconData,
    required this.onTap,
    required this.title,
    required this.subTitle,
  });
  final IconData iconData;
  final VoidCallback onTap;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorApp.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(10),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(10.0.r),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: ColorApp.peach,
            child: Icon(iconData, color: ColorApp.black),
          ),
          title: Text(title),
          subtitle: Text(subTitle),
        ),
      ),
    );
  }
}
