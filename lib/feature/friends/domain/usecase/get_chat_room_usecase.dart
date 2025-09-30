import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/constants/link_app.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/friends/domain/repo_abs/friend_repo_abs.dart';

class GetChatRoomUsecase {
  GetChatRoomUsecase(this.friendRepoAbs);

  late FriendRepoAbs friendRepoAbs;
  Future<ApiResult> selectChatRoom(int value, int value2) async {
    try {
      var response = await friendRepoAbs.selectChatRoom(value, value2, {
        ColumsApp.chatUser1: value,
        ColumsApp.chatUser2: value2,
      });
      return ApiSuccess(response);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
