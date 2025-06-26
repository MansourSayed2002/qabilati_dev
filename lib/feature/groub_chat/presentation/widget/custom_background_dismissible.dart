import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';

class CustomBackgroundDismissible extends StatelessWidget {
  const CustomBackgroundDismissible({
    super.key,
    required this.color,
    required this.iconData,
    required this.title,
    this.mainAxisAlignment,
  });
  final Color color;
  final IconData iconData;
  final String title;
  final MainAxisAlignment? mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        children: [
          Icon(iconData, color: ColorApp.white),
          Gap(4.0),
          Text(title, style: getSmallStyle(color: ColorApp.white)),
        ],
      ),
    );
  }
}
