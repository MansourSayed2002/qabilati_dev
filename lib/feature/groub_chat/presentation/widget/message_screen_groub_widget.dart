import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/class/supabase_connect.dart';
import 'package:qabilati/core/function/get_info_member.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/shared/message_types_send.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/groub_chat/presentation/cubit/groub_chat_cubit.dart';
import 'package:qabilati/feature/groub_chat/data/model/message_sender_model.dart';

class MessageScreenGroubWidget extends StatelessWidget {
  const MessageScreenGroubWidget({super.key, required this.chatRoomId});

  final int chatRoomId;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: SupabaseConnect.supabase
            .from("message")
            .stream(primaryKey: ["message_id"])
            .eq("message_roomchat_id", chatRoomId)
            .order("created_at"),
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(color: ColorApp.coral),
            );
          }
          return ListView.builder(
            reverse: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              MessageSenderModel message = MessageSenderModel.fromjson(
                snapshot.data![index],
              );
              return MessageGroubWidget(message: message);
            },
          );
        },
      ),
    );
  }
}

class MessageGroubWidget extends StatelessWidget {
  const MessageGroubWidget({super.key, required this.message});
  final MessageSenderModel message;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          message.messageSenderId ==
                  LocalStorageApp.getHiveData("user_data")['user_id']
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
      children: [
        message.messageSenderId !=
                LocalStorageApp.getHiveData("user_data")['user_id']
            ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0.r),
                child: CachedNetworkImage(
                  width: 25.0.w,
                  height: 25.0.h,
                  errorWidget:
                      (context, url, error) => CircleAvatar(
                        backgroundColor: ColorApp.grey,
                        child: Icon(Icons.person),
                      ),
                  imageUrl:
                      "${dotenv.env['SUPABASE_URL_IMAGE']}${getInfoMemebr(getIt<GroubChatCubit>().groupMembers, message.messageSenderId ?? 0)?.image}",
                  fit: BoxFit.cover,
                ),
              ),
            )
            : SizedBox.shrink(),
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * .7,
          ),
          margin:
              message.messageSenderId !=
                      LocalStorageApp.getHiveData("user_data")['user_id']
                  ? EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 13.0.h)
                  : EdgeInsets.symmetric(horizontal: 13.0.w, vertical: 13.0.h),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              message.messageSenderId !=
                      LocalStorageApp.getHiveData("user_data")['user_id']
                  ? Text(
                    "${getInfoMemebr(getIt<GroubChatCubit>().groupMembers, message.messageSenderId ?? 0)?.name ?? "name"}",
                    style: getSmallStyle(color: ColorApp.white),
                  )
                  : SizedBox.shrink(),
              message.messageType == 0
                  ? TextMessageWidget(message: message)
                  : message.messageType == 2
                  ? ImageMessageWidget(message: message)
                  : message.messageType == 4
                  ? PdfMessageWidget(message: message)
                  : message.messageType == 6 || message.messageType == 1
                  ? MusicMessageWidget(message: message)
                  : VideoMessageWidget(message: message),
            ],
          ),
        ),
      ],
    );
  }
}
