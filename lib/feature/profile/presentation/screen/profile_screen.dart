import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/constants/image_app.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/theme/color_app.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(children: [CustomHeaderWidget()]));
  }
}

class CustomHeaderWidget extends StatelessWidget {
  const CustomHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160.0.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageApp.logo),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 20.0,
                  color: ColorApp.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.camera_alt_rounded, color: ColorApp.white),
              ),
            ],
          ),
          PositionedDirectional(
            start: 20.0.w,
            bottom: -40.0.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0.r),
              child: CachedNetworkImage(
                width: 80.0.w,
                height: 90.0.h,
                fit: BoxFit.cover,
                imageUrl:
                    "${dotenv.env['SUPABASE_URL_IMAGE']}${LocalStorageApp.getHiveData("user_data")["user_image"]}",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
