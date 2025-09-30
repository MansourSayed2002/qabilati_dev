import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/auth/data/model/user_model.dart';
import 'package:qabilati/feature/friends/domain/repo_abs/friend_repo_abs.dart';

class GetPendingFriendRequestUsecase {
  GetPendingFriendRequestUsecase(this.friendRepoAbs);

  late FriendRepoAbs friendRepoAbs;

  Future<ApiResult> getPendingFriend() async {
    try {
      UserModel user = await LocalStorageApp.getHiveData(
        LocalStorageApp.userData,
      );
      var response = await friendRepoAbs.getPendingFriendRequest({
        "target_user_id": user.id,
      });
      return ApiSuccess(response);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
