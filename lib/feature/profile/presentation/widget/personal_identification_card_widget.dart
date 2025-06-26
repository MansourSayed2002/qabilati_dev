import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/profile/presentation/screen/profile_screen.dart';
import 'package:qabilati/feature/profile/presentation/screen/qr_screen.dart';

class PersonalIdentificationCardWidget extends StatelessWidget {
  const PersonalIdentificationCardWidget({
    super.key,
    required this.image,
    required this.name,
    required this.uuid,
  });
  final String image;
  final String name;
  final String uuid;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w, bottom: 10.0.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0.r),
            child: CachedNetworkImage(
              width: 80.0.w,
              height: 80.0.h,
              fit: BoxFit.cover,
              imageUrl: image,
            ),
          ),
          Gap(10.0.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: getBodyStyle(context: context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Gap(6.0.h),
                Text(
                  uuid,
                  style: getSmallStyle(),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  context.push(QrScreen(uuid: uuid));
                },
                icon: Icon(Icons.qr_code_rounded),
              ),
              IconButton(
                onPressed: () {
                  context.push(ProfileScreen());
                },
                icon: Icon(Icons.arrow_forward_ios_rounded, size: 15.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
