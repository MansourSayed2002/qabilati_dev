import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/auth/domain/repo_abs/repo_abs.dart';

class CheckVerifyUseCase {
  CheckVerifyUseCase(this.repo);

  RepoAbs repo;

  Future<ApiResult> checkVerifyCode(String otp) async {
    try {
      var response = await repo.checkVerifyCode(
        LocalStorageApp.getHiveData("user_data")['user_phone'],
      );
      if (response.first['user_verifycode'].toString() == otp) {
        return ApiSuccess(StatusRequest.success);
      } else {
        return ApiFailure(StatusRequest.failure);
      }
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
