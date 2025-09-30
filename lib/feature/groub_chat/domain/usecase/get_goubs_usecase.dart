import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/auth/data/model/user_model.dart';
import 'package:qabilati/feature/groub_chat/domain/repo_abs/groub_achat_repo_abs.dart';

class GetGroubsUsecase {
  GetGroubsUsecase(this.groubChatRepoAbs);

  final GroubchatRepoAbs groubChatRepoAbs;

  Future<ApiResult> getGroubs() async {
     UserModel user = await LocalStorageApp.getHiveData(
        LocalStorageApp.userData,
      );
    try {
      List response = await groubChatRepoAbs.getGorubs({
        "target_member_id": user.id,
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
