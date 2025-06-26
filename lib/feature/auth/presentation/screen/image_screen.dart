import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/extension/message_bar.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/function/loading_widget.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/shared/elevated_button_widget.dart';
import 'package:qabilati/core/shared/image_widget.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:qabilati/feature/main/screen/main_screen.dart';
import 'package:qabilati/generated/l10n.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthCubit>(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6.0.w, vertical: 6.0.h),
              padding: EdgeInsets.symmetric(horizontal: 6.0.w, vertical: 6.0.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0.r),
                color: ColorApp.peach,
              ),
              child: Text(
                "3/3",
                style: getSmallStyle(color: ColorApp.midnightBlue),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.0.w),
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is ImageSuccess) {
                LocalStorageApp.saveData("step", "2");
                context.removeUntile(MainScreen());
              } else if (state is ImageLoading) {
                loadingWidget(context);
              } else if (state is ImageError) {
                context.messageBar(S.of(context).message_error);
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(value: 3 / 3, color: ColorApp.coral),
                Gap(50.0.h),
                Text(
                  S.of(context).add_image,
                  style: getBodyStyle(context: context),
                ),
                Gap(10.0.h),
                Text(S.of(context).image_body, style: getSmallStyle()),
                Gap(20.0.h),
                Center(child: ImageWidget(controller: getIt<AuthCubit>())),
                Gap(30.0.h),
                ElevatedButtonWidget(
                  title: S.of(context).upload_image,
                  onTap: () {
                    getIt<AuthCubit>().uploadFile();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
