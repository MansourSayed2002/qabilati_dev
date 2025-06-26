import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/core/function/get_token.dart';
import 'package:qabilati/feature/auth/data/model/user_model.dart';
import 'package:qabilati/feature/auth/domain/repo_abs/repo_abs.dart';

class RegisterUsecase {
  RegisterUsecase(this.repoAbs);
  RepoAbs repoAbs;
  Future<ApiResult> register(UserModel data) async {
    try {
      String token = await getToken();
      var id = await repoAbs.register({
        "user_name": data.username,
        "user_emailgoogle": data.email,
        "user_phone": data.phone,
        "user_token": token,
      });
      LocalStorageApp.setHiveData("user_data", {
        "user_name": data.username,
        "user_emailgoogle": data.email,
        "user_phone": data.phone,
        "user_id": id.first['user_id'],
      });
      return ApiSuccess(StatusRequest.success);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.serverfailure);
    }
  }
}
