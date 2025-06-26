import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';

class CardGroubWidget extends StatelessWidget {
  const CardGroubWidget({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });
  final String title;
  final Function() onTap;
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0.r),
            child: CachedNetworkImage(
              width: 60.0.w,
              height: 60.0.h,
              imageUrl: "${dotenv.env['SUPABASE_URL_IMAGE']}$image",
              fit: BoxFit.cover,
            ),
          ),
          Gap(10.0.w),
          Text(title, style: getBodyStyle(fontSize: 17.0.sp, context: context)),
        ],
      ),
    );
  }
}
