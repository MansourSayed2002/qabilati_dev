import 'package:flutter/material.dart';
import 'package:qabilati/core/class/supabase_connect.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/feature/chat_room/presentation/widget/message_widget.dart';
import 'package:qabilati/feature/groub_chat/data/model/message_sender_model.dart';

class MessageScreenWidget extends StatelessWidget {
  const MessageScreenWidget({super.key, required this.chatRoomId});

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
              return MessageWidget(message: message);
            },
          );
        },
      ),
    );
  }
}
