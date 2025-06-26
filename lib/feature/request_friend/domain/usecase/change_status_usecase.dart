import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/request_friend/domain/repo_abs/repo_request_friend_abs.dart';

class ChangeStatusUsecase {
  ChangeStatusUsecase(this.repoRequestFriendAbs);

  late RepoRequestFriendAbs repoRequestFriendAbs;

  Future<ApiResult> changeStatus(int status, int id) async {
    try {
      await repoRequestFriendAbs.changeStatus({"friend_status": status}, id);
      return ApiSuccess(StatusRequest.success);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
