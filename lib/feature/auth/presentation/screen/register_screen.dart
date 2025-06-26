import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/enum/type.dart';
import 'package:qabilati/core/extension/message_bar.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/function/loading_widget.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:qabilati/feature/auth/presentation/screen/verifycode_screen.dart';
import 'package:qabilati/feature/auth/presentation/widget/text_form_rigster.dart';
import 'package:qabilati/generated/l10n.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "1/3",
              style: getSmallStyle(color: ColorApp.midnightBlue),
            ),
          ),
        ],
      ),
      body: BlocProvider.value(
        value: getIt<AuthCubit>(),
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is RegisterLoading) {
              loadingWidget(context);
            } else if (state is RegisterSuccess) {
              context.pop();
              context.pushRepalceMent(
                VerifycodeScreen(type: TypeEnum.register),
              );
            } else if (state is RegisterError) {
              context.pop();
              context.messageBar(S.of(context).message_error);
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.0.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LinearProgressIndicator(value: 1 / 3, color: ColorApp.coral),
                  Gap(50.0.h),
                  Text(
                    S.of(context).title_register,
                    style: getBodyStyle(context: context),
                  ),
                  Gap(10.0.h),
                  Text(S.of(context).body_register, style: getSmallStyle()),
                  Gap(20.0.h),
                  TextFormRigster(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
