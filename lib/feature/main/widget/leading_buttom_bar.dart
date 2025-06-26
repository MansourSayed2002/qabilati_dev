import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/constants/image_app.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/function/choose_image_bar.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/notification/presentation/screen/notification_screen.dart';
import 'package:qabilati/feature/search/presentation/screen/search_screen.dart';
import 'package:qabilati/generated/l10n.dart';

class LeadingButtomBar extends StatelessWidget {
  const LeadingButtomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0.w),
      child: PopupMenuButton(
        borderRadius: BorderRadius.circular(10.0.r),
        color: ColorApp.greymiddle,
        icon: SvgPicture.asset(
          chooseImageBar(ImageApp.union, ImageApp.uniondark),
          width: 18.0.w,
        ),
        itemBuilder:
            (context) => <PopupMenuItem>[
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.search_rounded, size: 20.0),
                    Gap(10.0.w),
                    Text(
                      S.of(context).search,
                      style: getSmallStyle(color: ColorApp.black),
                    ),
                  ],
                ),
                onTap: () => context.push(SearchScreen()),
              ),
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.notifications_none_rounded, size: 20.0),
                    Gap(10.0.w),
                    Text(
                      S.of(context).notification,
                      style: getSmallStyle(color: ColorApp.black),
                    ),
                  ],
                ),
                onTap: () => context.push(NotificationScreen()),
              ),
            ],
      ),
    );
  }
}
