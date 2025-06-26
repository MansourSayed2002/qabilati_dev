import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/notification/domain/repo_abs/notifi_repo_abs.dart';

class GetNotificationUsecase {
  late NotifiRepoAbs notifiRepoAbs;
  GetNotificationUsecase(this.notifiRepoAbs);

  Future<ApiResult> getNotification() async {
    try {
      List response = await notifiRepoAbs.getnotificaions(
        LocalStorageApp.getHiveData("user_data")['user_id'],
      );
      return ApiSuccess(response);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
