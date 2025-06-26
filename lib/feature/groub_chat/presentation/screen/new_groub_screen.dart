import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/extension/message_bar.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/function/congratulation.dart';
import 'package:qabilati/core/function/loading_widget.dart';
import 'package:qabilati/core/function/validation.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/shared/arrow_back_widget.dart';
import 'package:qabilati/core/shared/custom_text_from_global.dart';
import 'package:qabilati/core/shared/image_widget.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/feature/groub_chat/presentation/cubit/groub_chat_cubit.dart';
import 'package:qabilati/generated/l10n.dart';

class NewGroubScreen extends StatefulWidget {
  const NewGroubScreen({super.key});

  @override
  State<NewGroubScreen> createState() => _NewGroubScreenState();
}

class _NewGroubScreenState extends State<NewGroubScreen> {
  TextEditingController textcontroller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    textcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<GroubChatCubit>(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(S.of(context).new_groub),
          leading: ArrowBackWidget(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorApp.coral,
          child: Icon(Icons.done_all, color: ColorApp.white),
          onPressed: () {
            getIt<GroubChatCubit>().createGroub(textcontroller.text);
          },
        ),
        body: Form(
          key: formKey,
          child: CustomBody(textcontroller: textcontroller, fromkey: formKey),
        ),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({
    super.key,
    required this.textcontroller,
    required this.fromkey,
  });
  final TextEditingController textcontroller;
  final GlobalKey<FormState> fromkey;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GroubChatCubit, GroubChatState>(
      listener: (context, state) {
        if (state is GroubChatSuccess) {
          context.pop();
          context.pop();
          congratulationWidget(context);
        } else if (state is GroubChatError) {
          context.messageBar(S.of(context).message_error);
        } else if (state is GroubChatLoading) {
          loadingWidget(context);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ImageWidget(
                  radius: 30.0.r,
                  isIcon: true,
                  iconData: Icons.camera_alt,
                  controller: getIt<GroubChatCubit>(),
                ),
                Gap(10.0.w),
                Expanded(
                  child: CustomTextFormGlobal(
                    controller: textcontroller,
                    hinttext: "",
                    validator: (value) {
                      if (fromkey.currentState!.validate()) {
                        return validationField(context, "text", 2, 30, value);
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
