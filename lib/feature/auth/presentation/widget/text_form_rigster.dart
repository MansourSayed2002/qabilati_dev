import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/function/validation.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/shared/custom_text_from_global.dart';
import 'package:qabilati/core/shared/elevated_button_widget.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/auth/data/model/user_model.dart';
import 'package:qabilati/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:qabilati/generated/l10n.dart';

class TextFormRigster extends StatefulWidget {
  const TextFormRigster({super.key});

  @override
  State<TextFormRigster> createState() => _TextFormRigsterState();
}

class _TextFormRigsterState extends State<TextFormRigster> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).username,
            style: getBodyStyle(fontSize: 15.0.sp, context: context),
          ),
          Gap(8.0.h),
          CustomTextFormGlobal(
            controller: nameController,
            hinttext: S.of(context).hint_name,
            validator: (value) {
              return validationField(context, "text", 2, 30, value);
            },
          ),
          Gap(10.0.h),
          Text(
            S.of(context).email,
            style: getBodyStyle(fontSize: 15.0.sp, context: context),
          ),
          Gap(8.0.h),
          CustomTextFormGlobal(
            controller: emailController,
            hinttext: S.of(context).hint_email,
            validator: (value) {
              return validationField(context, "email", 2, 80, value);
            },
          ),
          Gap(10.0.h),
          Text(
            S.of(context).phone_number,
            style: getBodyStyle(fontSize: 15.0.sp, context: context),
          ),
          Gap(8.0.h),
          CustomTextFormGlobal(
            controller: phoneController,
            hinttext: S.of(context).hint_phone,
            validator: (value) {
              return validationField(context, "phone", 11, 11, value);
            },
          ),
          Gap(30.0.h),
          ElevatedButtonWidget(
            title: S.of(context).continue_bu,
            onTap: () {
              if (key.currentState!.validate()) {
                getIt<AuthCubit>().register(
                  UserModel(
                    username: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
