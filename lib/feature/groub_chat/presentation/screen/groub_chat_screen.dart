import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/enum/type_scan.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/shared/arrow_back_widget.dart';

import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/groub_chat/data/model/groubs_model.dart';
import 'package:qabilati/feature/groub_chat/presentation/cubit/groub_chat_cubit.dart';
import 'package:qabilati/feature/groub_chat/presentation/screen/new_groub_screen.dart';
import 'package:qabilati/feature/groub_chat/presentation/screen/realtime_groub_chat_screen.dart';
import 'package:qabilati/feature/groub_chat/presentation/widget/card_groub_widget.dart';
import 'package:qabilati/feature/scanner/scanner_screen.dart';
import 'package:qabilati/generated/l10n.dart';

class GroubChatScreen extends StatelessWidget {
  const GroubChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<GroubChatCubit>()..getGroubs(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(S.of(context).groub_chats),
          leading: ArrowBackWidget(),
          actions: [
            PopupMenuButton(
              itemBuilder:
                  (context) => <PopupMenuItem>[
                    PopupMenuItem(
                      value: 1,
                      child: Text(
                        S.of(context).new_groub,
                        style: getSmallStyle(),
                      ),
                      onTap: () {
                        context.push(NewGroubScreen());
                      },
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text(
                        S.of(context).scan_qr,
                        style: getSmallStyle(),
                      ),
                      onTap: () {
                        context.push(
                          ScannerScreen(
                            typeScannerWork: TypeScannerWork.addGroup,
                          ),
                        );
                      },
                    ),
                  ],
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.0.w, vertical: 17.0.h),
          child: CustomBody(),
        ),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroubChatCubit, GroubChatState>(
      builder: (context, state) {
        var cubit = getIt<GroubChatCubit>();
        return ListView.separated(
          itemCount: cubit.groups.length,
          separatorBuilder: (context, index) => Gap(10.0.h),
          itemBuilder: (context, index) {
            GroubsModel groubsModel = GroubsModel.fromJson(cubit.groups[index]);
            return CardGroubWidget(
              image: groubsModel.image.toString(),
              title: groubsModel.name.toString(),
              onTap: () {
                getIt<GroubChatCubit>().getGroupMembers(groubsModel.id ?? 0);
                context.push(RealtimeGroubChatScreen(groub: groubsModel));
              },
            );
          },
        );
      },
    );
  }
}
