import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/auth/data/model/user_model.dart';
import 'package:qabilati/feature/friends/domain/repo_abs/friend_repo_abs.dart';

class GetFriendsUsecase {
  GetFriendsUsecase(this.friendRepoAbs);
  late FriendRepoAbs friendRepoAbs;
  Future<ApiResult> getFriend() async {
    UserModel user = await LocalStorageApp.getHiveData(
      LocalStorageApp.userData,
    );
    try {
      List response = await friendRepoAbs.getFriend({
        'target_user_id': user.id,
      });
      if (response.isNotEmpty) {
        return ApiSuccess(response);
      } else {
        return ApiFailure(StatusRequest.failure);
      }
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
