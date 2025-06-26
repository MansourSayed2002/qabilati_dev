import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/friends/domain/repo_abs/friend_repo_abs.dart';

class GetPendingFriendRequestUsecase {
  GetPendingFriendRequestUsecase(this.friendRepoAbs);

  late FriendRepoAbs friendRepoAbs;

  Future<ApiResult> getPendingFriend() async {
    try {
      var response = await friendRepoAbs.getPendingFriendRequest({
        "target_user_id": LocalStorageApp.getHiveData("user_data")['user_id'],
      });
      return ApiSuccess(response);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
