import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/function/is_arabic.dart';
import 'package:voice_note_kit/player/audio_player_widget.dart';
import 'package:voice_note_kit/player/player_enums/player_enums.dart';
import 'package:qabilati/core/enum/type_file.dart';
import 'package:qabilati/core/function/open_any_files.dart';
import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:qabilati/feature/groub_chat/data/model/message_sender_model.dart';

class PdfMessageWidget extends StatelessWidget {
  const PdfMessageWidget({super.key, required this.message});
  final MessageSenderModel message;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await openAnyFiles(
          typeFile: TypeFileEnum.pdf,
          path: "${message.messageContent}",
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Text(
              message.messageContent.toString().split('/').last,
              style: getSmallStyle(color: ColorApp.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Gap(10.0.w),
          Icon(Icons.picture_as_pdf, size: 40.0, color: ColorApp.white),
        ],
      ),
    );
  }
}

class TextMessageWidget extends StatelessWidget {
  const TextMessageWidget({super.key, required this.message});
  final MessageSenderModel message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message.messageContent.toString(),
      style: getSmallStyle(fontSize: 16.0.sp, color: ColorApp.white),
      textDirection:
          isArabic(message.messageContent.toString())
              ? TextDirection.rtl
              : TextDirection.ltr,
    );
  }
}

class ImageMessageWidget extends StatelessWidget {
  const ImageMessageWidget({super.key, required this.message});

  final MessageSenderModel message;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await openAnyFiles(
          typeFile: TypeFileEnum.camera,
          path: "${message.messageContent}",
        );
      },
      child: ClipRRect(
        borderRadius:
            message.messageSenderId ==
                    LocalStorageApp.getHiveData("user_data")['user_id']
                ? BorderRadius.only(
                  bottomLeft: Radius.circular(8.0.r),
                  topRight: Radius.circular(8.0.r),
                  bottomRight: Radius.circular(8.0.r),
                )
                : BorderRadius.only(
                  bottomLeft: Radius.circular(8.0.r),

                  bottomRight: Radius.circular(8.0.r),
                  topLeft: Radius.circular(8.0.r),
                ),
        child: CachedNetworkImage(
          height: 100.0.h,
          width: 100.0.w,
          fit: BoxFit.cover,
          imageUrl:
              "${dotenv.env['SUPABASE_URL_IMAGE']}${message.messageContent}",
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}

class MusicMessageWidget extends StatelessWidget {
  const MusicMessageWidget({super.key, required this.message});
  final MessageSenderModel message;

  @override
  Widget build(BuildContext context) {
    return AudioPlayerWidget(
      autoPlay: false,
      autoLoad: false,
      audioPath:
          "${dotenv.env['SUPABASE_URL_RECORD']}${message.messageContent}",
      audioType: AudioType.url,
      playerStyle: PlayerStyle.style5,
      textDirection:
          message.messageSenderId ==
                  LocalStorageApp.getHiveData("user_data")['user_id']
              ? TextDirection.rtl
              : TextDirection.rtl,
      size: 50,
      progressBarHeight: 3,
      backgroundColor:
          message.messageSenderId ==
                  LocalStorageApp.getHiveData("user_data")['user_id']
              ? ColorApp.coral
              : ColorApp.midnightBlue,
      progressBarColor: Colors.blue,
      progressBarBackgroundColor: Colors.white,
      iconColor: Colors.white,
      shapeType: PlayIconShapeType.roundedRectangle,
      showProgressBar: true,
      showTimer: true,
      width: 300.w,
      audioSpeeds: const [0.5, 1.0, 1.5, 2.0, 3.0],
      onError: (message) {
        log(message);
      },
    );
  }
}

class VideoMessageWidget extends StatelessWidget {
  const VideoMessageWidget({super.key, required this.message});

  final MessageSenderModel message;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await openAnyFiles(
          typeFile: TypeFileEnum.video,
          path: "${message.messageContent}",
        );
      },
      child: ClipRRect(
        borderRadius:
            message.messageSenderId ==
                    LocalStorageApp.getHiveData("user_data")['user_id']
                ? BorderRadius.only(
                  bottomLeft: Radius.circular(8.0.r),
                  topRight: Radius.circular(8.0.r),
                  bottomRight: Radius.circular(8.0.r),
                )
                : BorderRadius.only(
                  bottomLeft: Radius.circular(8.0.r),

                  bottomRight: Radius.circular(8.0.r),
                  topLeft: Radius.circular(8.0.r),
                ),
        child: CachedNetworkImage(
          height: 100.0.h,
          width: 100.0.w,
          fit: BoxFit.cover,
          imageUrl:
              "${dotenv.env['SUPABASE_URL_VIDEO']}${message.messageContent}",
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
