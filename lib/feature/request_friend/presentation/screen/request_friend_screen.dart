import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/shared/arrow_back_widget.dart';
import 'package:qabilati/core/shared/net_work_image_widget.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/request_friend/presentation/cubit/request_friend_cubit.dart';
import 'package:qabilati/feature/request_friend/presentation/widget/buttom_friend_ship.dart';
import 'package:qabilati/core/model/friends_model.dart';

class RequestFriendScreen extends StatelessWidget {
  const RequestFriendScreen({super.key, required this.user});
  final FriendsModel user;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<RequestFriendCubit>(),
      child: Scaffold(
        appBar: AppBar(leading: ArrowBackWidget()),
        body: Padding(
          padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w, bottom: 10.0.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0.r),
                child: NetWorkImageWidget(
                  width: 100.0.w,
                  height: 120.0.w,
                  fit: BoxFit.cover,
                  image: "${dotenv.env['SUPABASE_URL_IMAGE']}${user.image}",
                ),
              ),
              Gap(10.0.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${user.username}',
                      style: getBodyStyle(context: context),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gap(6.0.h),
                    Text(
                      "${user.uuid}",
                      style: getSmallStyle(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gap(23.0.h),
                    ButtomFriendShip(user: user),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
