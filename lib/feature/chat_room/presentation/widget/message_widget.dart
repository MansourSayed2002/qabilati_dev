import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/shared/message_types_send.dart';
import 'package:qabilati/feature/groub_chat/data/model/message_sender_model.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.message});
  final MessageSenderModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          message.messageSenderId ==
                  LocalStorageApp.getHiveData("user_data")['user_id']
              ? Alignment.topLeft
              : Alignment.topRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * .7,
        ),
        margin: EdgeInsets.symmetric(horizontal: 13.0.w, vertical: 13.0.h),
        padding:
            message.messageType != 2
                ? EdgeInsets.symmetric(horizontal: 13.0.w, vertical: 8.0.h)
                : null,
        decoration: BoxDecoration(
          color:
              message.messageSenderId ==
                      LocalStorageApp.getHiveData("user_data")['user_id']
                  ? ColorApp.coral
                  : ColorApp.midnightBlue,
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
        ),
        child:
            message.messageType == 0
                ? TextMessageWidget(message: message)
                : message.messageType == 2
                ? ImageMessageWidget(message: message)
                : message.messageType == 4
                ? PdfMessageWidget(message: message)
                : message.messageType == 6 || message.messageType == 1
                ? MusicMessageWidget(message: message)
                : VideoMessageWidget(message: message),
      ),
    );
  }
}
