import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/constants/image_app.dart';
import 'package:qabilati/core/enum/type.dart';
import 'package:qabilati/core/extension/message_bar.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/function/loading_widget.dart';
import 'package:qabilati/core/function/validation.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/shared/custom_another_page_global.dart';
import 'package:qabilati/core/shared/custom_text_from_global.dart';
import 'package:qabilati/core/shared/elevated_button_widget.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:qabilati/feature/auth/presentation/screen/register_screen.dart';
import 'package:qabilati/feature/auth/presentation/screen/verifycode_screen.dart';
import 'package:qabilati/generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AuthCubit>(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LogInLoading) {
            loadingWidget(context);
          } else if (state is LogInSuccess) {
            context.push(VerifycodeScreen(type: TypeEnum.login));
          } else if (state is LogInError) {
            context.pop();
            context.messageBar(S.of(context).message_error);
          }
        },
        builder: (context, state) {
          var cubit = getIt<AuthCubit>();
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 17.0.w,
                vertical: 50.0.h,
              ),
              child: Form(
                key: key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImageApp.logoCir, width: 80.0.w),
                    Gap(25.0.h),
                    Text(
                      S.of(context).welcome_login,
                      style: getBodyStyle(context: context),
                    ),
                    Gap(10.0.h),
                    Text(
                      S.of(context).login_explain,
                      style: getSmallStyle(),
                      textAlign: TextAlign.center,
                    ),
                    Gap(20.0.h),
                    Row(
                      children: [
                        Text(
                          S.of(context).phone_number,
                          style: getBodyStyle(
                            fontSize: 15.0.sp,
                            context: context,
                          ),
                        ),
                      ],
                    ),
                    Gap(8.0.h),
                    CustomTextFormGlobal(
                      controller: phoneController,
                      hinttext: S.of(context).hint_phone,
                      validator: (value) {
                        return validationField(context, "phone", 11, 11, value);
                      },
                    ),
                    Gap(20.0.h),
                    ElevatedButtonWidget(
                      title: S.of(context).login,
                      onTap: () {
                        if (key.currentState!.validate()) {
                          cubit.login(phoneController.text);
                        }
                      },
                    ),
                    Spacer(),
                    CustomAnotherPageGlobal(
                      ontap: () {
                        context.push(RegisterScreen());
                      },
                      textone: S.of(context).not_connect_yet,
                      texttwo: S.of(context).create_account,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
