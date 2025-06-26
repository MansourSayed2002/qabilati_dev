import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/friends/domain/repo_abs/friend_repo_abs.dart';

class RejectFriendUsecase {
  RejectFriendUsecase(this.friendRepoAbs);
  late FriendRepoAbs friendRepoAbs;

  Future<ApiResult> rejectFriend(int requestId, int replyId) async {
    try {
      await friendRepoAbs.rejectRequestFriend(requestId, replyId);
      return ApiSuccess(StatusRequest.success);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
