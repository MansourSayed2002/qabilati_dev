import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/notification/domain/repo_abs/notifi_repo_abs.dart';

class AcceptRequestFriendUsecase {
  AcceptRequestFriendUsecase(this.notifiRepoAbs);
  late NotifiRepoAbs notifiRepoAbs;

  Future<ApiResult> acceptFriend(
    int notifiId,
    int requestId,
    int replyId,
  ) async {
    try {
      await notifiRepoAbs.acceptRequestFriend(notifiId, requestId, replyId);
      return ApiSuccess(StatusRequest.success);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
