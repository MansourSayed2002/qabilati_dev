import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qabilati/core/constants/image_app.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [Cardships()]));
  }
}

class Cardships extends StatelessWidget {
  const Cardships({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SvgPicture.asset(ImageApp.newFriend, width: 100.0.w, height: 100.0.h),
          Text("data"),
        ],
      ),
    );
  }
}
