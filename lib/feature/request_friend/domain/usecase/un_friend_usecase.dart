import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/request_friend/domain/repo_abs/repo_request_friend_abs.dart';

class UnFriendUsecase {
  late RepoRequestFriendAbs repoRequestFriendAbs;
  UnFriendUsecase(this.repoRequestFriendAbs);
  Future<ApiResult> unFriend(int value) async {
    try {
      await repoRequestFriendAbs.unFriend(value);
      return ApiSuccess(StatusRequest.success);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
