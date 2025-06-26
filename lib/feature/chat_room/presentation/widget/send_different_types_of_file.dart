import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/enum/type_file.dart';
import 'package:qabilati/core/function/image_picker.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/feature/chat_room/presentation/cubit/chat_room_cubit.dart';

class SendDifferentTypesOfFile extends StatelessWidget {
  const SendDifferentTypesOfFile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatRoomCubit, ChatRoomState>(
      buildWhen:
          (previous, current) => current is FileFalse || current is FileTrue,
      builder: (context, state) {
        if (state is FileTrue) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
            decoration: BoxDecoration(
              color: ColorApp.grey,
              borderRadius: BorderRadius.circular(8.0.r),
            ),
            child: Wrap(
              spacing: 10.0.w,
              children: [
                ChooseTypeFileButton(
                  iconData: Icons.camera_alt,
                  color: Colors.pink,
                  onTap: () async {
                    String? filePath = await imagePicker(false);
                    if (filePath != null) {
                      
                      getIt<ChatRoomCubit>().typefileenum = TypeFileEnum.camera;
                      getIt<ChatRoomCubit>().path.add(File(filePath));
                      getIt<ChatRoomCubit>().changeFile();
                      getIt<ChatRoomCubit>().changeShowFileToTrue();
                    }
                  },
                ),
                ChooseTypeFileButton(
                  iconData: Icons.photo_library,
                  color: Colors.blue,

                  onTap: () async {
                    List<File>? files = await filePicker(
                      allowedMultiple: true,
                      allowedExtensions: ["jpg", "jpeg", "png", "mp4"],
                    );
                    if (files != null) {
                      getIt<ChatRoomCubit>().typefileenum =
                          TypeFileEnum.gallery;
                      getIt<ChatRoomCubit>().path = files;
                      getIt<ChatRoomCubit>().changeFile();
                      getIt<ChatRoomCubit>().changeShowFileToTrue();
                    }
                  },
                ),
                ChooseTypeFileButton(
                  iconData: Icons.video_library_rounded,
                  color: Colors.teal,
                  onTap: () async {
                    List<File>? files = await filePicker(
                      allowedMultiple: true,
                      allowedExtensions: ["mp4"],
                    );
                    if (files != null) {
                      getIt<ChatRoomCubit>().typefileenum = TypeFileEnum.video;
                      getIt<ChatRoomCubit>().path = files;
                      getIt<ChatRoomCubit>().changeFile();
                      getIt<ChatRoomCubit>().changeShowFileToTrue();
                    }
                  },
                ),
                ChooseTypeFileButton(
                  iconData: Icons.file_copy,
                  color: Colors.deepPurple,
                  onTap: () async {
                    List<File>? files = await filePicker(
                      allowedMultiple: true,
                      allowedExtensions: ["pdf"],
                    );
                    if (files != null) {
                      getIt<ChatRoomCubit>().typefileenum = TypeFileEnum.pdf;
                      getIt<ChatRoomCubit>().path = files;
                      getIt<ChatRoomCubit>().changeFile();
                      getIt<ChatRoomCubit>().changeShowFileToTrue();
                    }
                  },
                ),
                ChooseTypeFileButton(
                  iconData: Icons.headphones,
                  color: ColorApp.red,
                  onTap: () async {
                    List<File>? files = await filePicker(
                      allowedMultiple: false,
                      allowedExtensions: ["mp3"],
                    );
                    if (files != null) {
                      getIt<ChatRoomCubit>().typefileenum = TypeFileEnum.pdf;
                      getIt<ChatRoomCubit>().path = files;
                      getIt<ChatRoomCubit>().changeFile();
                      getIt<ChatRoomCubit>().changeShowFileToTrue();
                    }
                  },
                ),
                ChooseTypeFileButton(
                  iconData: Icons.location_on,
                  color: Colors.green,
                  onTap: () {},
                ),
              ],
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}

class ChooseTypeFileButton extends StatelessWidget {
  const ChooseTypeFileButton({
    super.key,
    required this.onTap,
    required this.iconData,
    this.color,
  });
  final Function() onTap;
  final IconData iconData;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 13.0.w, vertical: 13.0.h),
        padding: EdgeInsets.symmetric(horizontal: 13.0.w, vertical: 13.0.h),
        decoration: BoxDecoration(
          color: ColorApp.white,
          borderRadius: BorderRadius.circular(8.0.r),
        ),
        child: Icon(iconData, color: color),
      ),
    );
  }
}
