import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/enum/type_scan.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/groub_chat/data/model/groubs_model.dart';
import 'package:qabilati/feature/groub_chat/data/model/member_group_model.dart';
import 'package:qabilati/feature/groub_chat/presentation/cubit/groub_chat_cubit.dart';
import 'package:qabilati/feature/groub_chat/presentation/widget/member_widget.dart';
import 'package:qabilati/feature/groub_chat/presentation/widget/other_sevice_widget.dart';
import 'package:qabilati/feature/profile/presentation/screen/qr_screen.dart';
import 'package:qabilati/feature/scanner/scanner_screen.dart';
import 'package:qabilati/generated/l10n.dart';

class InfoGroupScreen extends StatelessWidget {
  const InfoGroupScreen({
    super.key,
    required this.groub,
    required this.membersGroup,
  });
  final GroubsModel groub;
  final List<MemberGroupModel> membersGroup;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<GroubChatCubit>(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(S.of(context).groub_info),
        ),
        body: CustomBody(groub: groub, membersGroup: membersGroup),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({
    super.key,
    required this.groub,
    required this.membersGroup,
  });
  final GroubsModel groub;
  final List<MemberGroupModel> membersGroup;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0.r),
            child: CachedNetworkImage(
              width: 100.0.w,
              height: 100.0.h,
              errorWidget:
                  (context, url, error) => CircleAvatar(
                    backgroundColor: ColorApp.grey,
                    child: Icon(Icons.group),
                  ),
              imageUrl: "${dotenv.env['SUPABASE_URL_IMAGE']}${groub.image}",
              fit: BoxFit.cover,
            ),
          ),
          Gap(10.0.h),
          Text(groub.name.toString(), style: getBodyStyle(context: context)),
          Gap(10.0.h),
          Text(
            "${S.of(context).members}: ${membersGroup.length}",
            style: getSmallStyle(fontSize: 14.0.sp),
          ),
          OtherSeviceWidget(
            onTapQrCode: () {
              context.push(QrScreen(uuid: groub.uuid.toString()));
            },
            onTapAudioBroadcast: () {},
            onTapScannerQrCode: () {
              context.push(
                ScannerScreen(typeScannerWork: TypeScannerWork.addMemeber),
              );
            },
          ),
          Divider(),
          Gap(10.0.h),
          MemberWidget(
            membersGroup: membersGroup,
            ownerGroup: groub.ownerId ?? 0,
          ),
        ],
      ),
    );
  }
}
