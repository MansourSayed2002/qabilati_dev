import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/enum/type.dart';
import 'package:qabilati/core/extension/message_bar.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/function/loading_widget.dart';
import 'package:qabilati/core/function/validation.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/shared/elevated_button_widget.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:qabilati/feature/auth/presentation/screen/image_screen.dart';
import 'package:qabilati/feature/auth/presentation/widget/counter_widget.dart';
import 'package:qabilati/feature/auth/presentation/widget/opt_widget.dart';
import 'package:qabilati/feature/main/screen/main_screen.dart';
import 'package:qabilati/generated/l10n.dart';
import 'package:qabilati/core/class/zego_kit.dart';

class VerifycodeScreen extends StatefulWidget {
  const VerifycodeScreen({super.key, required this.type});
  final TypeEnum type;
  @override
  State<VerifycodeScreen> createState() => _VerifycodeScreenState();
}

class _VerifycodeScreenState extends State<VerifycodeScreen> {
  TextEditingController opt = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void initState() {
    getIt<AuthCubit>().sendVerify();
    super.initState();
  }

  @override
  void dispose() {
    opt.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthCubit>(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            widget.type == TypeEnum.register
                ? Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 6.0.w,
                    vertical: 6.0.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.0.w,
                    vertical: 6.0.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0.r),
                    color: ColorApp.peach,
                  ),
                  child: Text(
                    "2/3",
                    style: getSmallStyle(color: ColorApp.midnightBlue),
                  ),
                )
                : SizedBox(),
          ],
        ),
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is VerifyCodeSuccess) {
              if (LocalStorageApp.getData("initzego") == false) {
                ZegoKit.instance.onUserLogin(
                  userID:
                      LocalStorageApp.getHiveData(
                        "user_data",
                      )['user_id'].toString(),
                  userName:
                      LocalStorageApp.getHiveData(
                        "user_data",
                      )['user_name'].toString(),
                );
                LocalStorageApp.saveData("initzego", true);
              }

              if (widget.type == TypeEnum.register) {
                context.pushRepalceMent(ImageScreen());
              } else {
                LocalStorageApp.saveData("step", "2");
                context.removeUntile(MainScreen());
              }
            } else if (state is VerifyCodeLoading) {
              loadingWidget(context);
            } else if (state is VerifyCodeWrong) {
              context.pop();
              context.messageBar(S.of(context).error_verify);
            } else if (state is VerifyCodeFail) {
              context.pop();
              context.messageBar(S.of(context).message_error);
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.0.w),
            child: Form(
              key: key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.type == TypeEnum.register
                      ? LinearProgressIndicator(
                        value: 2 / 3,
                        color: ColorApp.coral,
                      )
                      : SizedBox(),
                  widget.type == TypeEnum.register ? Gap(50.0.h) : Gap(10.0.h),
                  Text(
                    S.of(context).VerifyYourEmail,
                    style: getBodyStyle(context: context),
                  ),
                  Gap(10.0.h),
                  Text(S.of(context).verify_body, style: getSmallStyle()),
                  Gap(20.0.h),
                  OptWidget(
                    controller: opt,
                    validator: (value) {
                      return validationField(context, "number", 5, 5, value);
                    },
                  ),
                  Gap(30.0.h),
                  CounterWidget(type: widget.type),
                  Gap(30.0.h),
                  ElevatedButtonWidget(
                    title: S.of(context).verify_email,
                    onTap: () {
                      if (key.currentState!.validate()) {
                        getIt<AuthCubit>().checkCode(opt.text);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
