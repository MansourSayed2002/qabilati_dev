import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/model/friends_model.dart';
import 'package:qabilati/core/shared/accept_or_reject_friend_widget.dart';
import 'package:qabilati/core/shared/arrow_back_widget.dart';
import 'package:qabilati/core/shared/net_work_image_widget.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/friends/presentation/cubit/friend_cubit.dart';
import 'package:qabilati/generated/l10n.dart';

class RequestFriendScreen extends StatelessWidget {
  const RequestFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<FriendsCubit>()..getPendingFriend(),
      child: Scaffold(
        appBar: AppBar(
          leading: ArrowBackWidget(),
          centerTitle: true,
          title: Text(S.of(context).friend_request),
        ),
        body: CustomBody(),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FriendsCubit, FriendsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = getIt<FriendsCubit>();
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.0.w, vertical: 17.0.h),
          child: ListView.separated(
            itemCount: cubit.friendPending.length,
            separatorBuilder: (context, index) => Gap(10.0.h),
            itemBuilder: (context, index) {
              FriendsModel friendsModel = FriendsModel.fromJson(
                cubit.friendPending[index],
              );
              return Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0.r),
                    child: NetWorkImageWidget(
                      width: 60.0.w,
                      height: 60.0.h,
                      fit: BoxFit.cover,
                      image:
                          "${dotenv.env['SUPABASE_URL_IMAGE']}${friendsModel.image}",
                    ),
                  ),
                  Gap(10.0.h),
                  Expanded(
                    child: Text(
                      friendsModel.username.toString(),
                      style: getBodyStyle(context: context),
                      maxLines: 2,
                    ),
                  ),
                  Gap(10.0.w),
                  AcceptOrRejectFriendWidget(
                    acceptFriendOnTap: () {
                      cubit.acceptFriend(
                        friendsModel.friendRequest!,
                        friendsModel.friendReplay!,
                      );
                    },
                    rejectFriendOnTap: () {
                      cubit.rejectFriend(
                        friendsModel.friendRequest!,
                        friendsModel.friendReplay!,
                      );
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
