import 'dart:developer';
import 'dart:io';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/constants/link_app.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/auth/data/model/user_model.dart';
import 'package:qabilati/feature/groub_chat/domain/repo_abs/groub_achat_repo_abs.dart';

class CreateNewGroubUsecase {
  final GroubchatRepoAbs groubChatRepoAbs;
  CreateNewGroubUsecase(this.groubChatRepoAbs);

  Future<ApiResult> createNewGroub(String groubName, String groubImage) async {
    UserModel user = await LocalStorageApp.getHiveData(
      LocalStorageApp.userData,
    );
    try {
      List response = await groubChatRepoAbs.createNewGroub({
        "groub_name": groubName,
        "groub_owner": user.id,
      });
      await groubChatRepoAbs.addMember({
        "member_id": user.id,
        "groub_id": response.first['id'],
      });
      await groubChatRepoAbs.uploadFile(
        "${TablesApp.pathImageGroubs}/${response.first['id']}/${groubImage.split("/").last}",
        File(groubImage),
        response.first['id'],
        {
          "groub_image":
              "${TablesApp.pathImageGroubs}${response.first['id']}/${groubImage.split("/").last}",
        },
      );
      return ApiSuccess(StatusRequest.success);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
