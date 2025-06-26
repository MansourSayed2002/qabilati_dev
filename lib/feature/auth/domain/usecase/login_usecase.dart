import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/auth/data/model/user_model.dart';
import 'package:qabilati/feature/auth/domain/repo_abs/repo_abs.dart';

class LoginUsecase {
  late RepoAbs repo;
  LoginUsecase(this.repo);

  Future<ApiResult> login(String phone) async {
    try {
      List response = await repo.logIn(phone);
      if (response.isNotEmpty) {
        LocalStorageApp.setHiveData("user_data", response.first);
        return ApiSuccess(UserModel.fromJson(response.first));
      } else {
        return ApiFailure(StatusRequest.failure);
      }
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.serverfailure);
    }
  }
}
