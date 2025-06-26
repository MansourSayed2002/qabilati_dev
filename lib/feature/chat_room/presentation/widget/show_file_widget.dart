import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/enum/type_file.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/chat_room/presentation/cubit/chat_room_cubit.dart';

class ShowFileWidget extends StatelessWidget {
  const ShowFileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatRoomCubit, ChatRoomState>(
      buildWhen:
          (previous, current) =>
              current is ShowFileFalse || current is ShowFileTrue,
      builder: (context, state) {
        if (state is ShowFileTrue) {
          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: 100.0.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0.w,
                  vertical: 10.0.h,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0.w,
                  vertical: 10.0.h,
                ),
                decoration: BoxDecoration(
                  color: ColorApp.grey,
                  borderRadius: BorderRadius.circular(8.0.r),
                ),
                child:
                    getIt<ChatRoomCubit>().typefileenum == TypeFileEnum.camera
                        ? Image.file(getIt<ChatRoomCubit>().path.first)
                        : getIt<ChatRoomCubit>().typefileenum ==
                            TypeFileEnum.gallery
                        ? CustomGallery(path: getIt<ChatRoomCubit>().path)
                        : getIt<ChatRoomCubit>().typefileenum ==
                            TypeFileEnum.pdf
                        ? CustomPdf(path: getIt<ChatRoomCubit>().path)
                        : getIt<ChatRoomCubit>().typefileenum ==
                            TypeFileEnum.music
                        ? CustomMusic(path: getIt<ChatRoomCubit>().path)
                        : null,
              ),
              Positioned(
                child: GestureDetector(
                  onTap: () {
                    getIt<ChatRoomCubit>().changeShowFileToFalse();
                  },
                  child: Icon(Icons.cancel, color: ColorApp.red),
                ),
              ),
            ],
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}

class CustomGallery extends StatelessWidget {
  const CustomGallery({super.key, required this.path});

  final dynamic path;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: path.length,
      separatorBuilder: (context, index) => Gap(10.0.w),
      itemBuilder: (context, index) {
        return Image.file(path[index]);
      },
    );
  }
}

class CustomMusic extends StatelessWidget {
  const CustomMusic({super.key, this.path});
  final dynamic path;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0.w,
      padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(8.0.r),
        border: Border.all(color: ColorApp.white, width: 2.0.w),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              path.path.split('/').last,
              style: getSmallStyle(color: ColorApp.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Gap(10.0.w),
          Icon(Icons.picture_as_pdf, size: 30.0),
        ],
      ),
    );
  }
}

class CustomPdf extends StatelessWidget {
  const CustomPdf({super.key, required this.path});

  final dynamic path;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: path.length,
      separatorBuilder: (context, index) => Gap(10.0.w),
      itemBuilder: (context, index) {
        return Container(
          width: 150.0.w,
          padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(8.0.r),
            border: Border.all(color: ColorApp.white, width: 2.0.w),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  path[index].path.split('/').last,
                  style: getSmallStyle(color: ColorApp.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Gap(10.0.w),
              Icon(Icons.picture_as_pdf, size: 30.0),
            ],
          ),
        );
      },
    );
  }
}
