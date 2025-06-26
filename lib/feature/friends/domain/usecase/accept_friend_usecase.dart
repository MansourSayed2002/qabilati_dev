import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/friends/domain/repo_abs/friend_repo_abs.dart';

class AcceptFriendUsecase {
  AcceptFriendUsecase(this.friendRepoAbs);
  late FriendRepoAbs friendRepoAbs;

  Future<ApiResult> acceptFriend(
    int requestId, int replyId) async {
    try {
      await friendRepoAbs.acceptRequestFriend(requestId, replyId);
      return ApiSuccess(StatusRequest.success);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
