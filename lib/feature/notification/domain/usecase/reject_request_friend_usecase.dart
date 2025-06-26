import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/notification/domain/repo_abs/notifi_repo_abs.dart';

class RejectRequestFriendUsecase {
  RejectRequestFriendUsecase(this.notifiRepoAbs);

  late NotifiRepoAbs notifiRepoAbs;

  Future<ApiResult> rejectFriend(
    int notifiId,
    int requestId,
    int replyId,
  ) async {
    try {
      notifiRepoAbs.rejectRequestFriend(notifiId, requestId, replyId);
      return ApiSuccess(StatusRequest.success);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
