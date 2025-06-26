import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/shared/net_work_image_widget.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/groub_chat/data/model/member_group_model.dart';
import 'package:qabilati/feature/groub_chat/presentation/cubit/groub_chat_cubit.dart';
import 'package:qabilati/feature/groub_chat/presentation/widget/custom_background_dismissible.dart';

class MemberWidget extends StatelessWidget {
  const MemberWidget({
    super.key,
    required this.membersGroup,
    required this.ownerGroup,
  });
  final List<MemberGroupModel> membersGroup;
  final int ownerGroup;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: membersGroup.length,
        separatorBuilder: (context, index) => Gap(10.0.h),
        itemBuilder:
            (context, index) => Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                if (direction == DismissDirection.endToStart) {
                  if (ownerGroup ==
                      LocalStorageApp.getHiveData("user_data")['user_id']) {
                    getIt<GroubChatCubit>().removeMembers(
                      membersGroup[index].id ?? 0,
                    );
                    membersGroup.removeAt(index);
                  }
                }
              },
              background: CustomBackgroundDismissible(
                title: "Remove Member",
                iconData: Icons.delete,
                color: ColorApp.red,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0.r),
                    child: NetWorkImageWidget(
                      image:
                          "${dotenv.env['SUPABASE_URL_IMAGE']}${membersGroup[index].image}",
                      width: 50.0.w,
                      height: 50.0.h,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Gap(10.0.w),
                  Text(
                    membersGroup[index].name.toString(),
                    style: getBodyStyle(context: context),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
