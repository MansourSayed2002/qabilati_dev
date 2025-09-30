import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/constants/link_app.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/auth/domain/repo_abs/repo_abs.dart';

class CheckVerifyUseCase {
  CheckVerifyUseCase(this.repo);

  RepoAbs repo;

  Future<ApiResult> checkVerifyCode(String otp) async {
    try {
      String phone =
          LocalStorageApp.getHiveData(LocalStorageApp.userData).phone;
      var response = await repo.checkVerifyCode(phone);
      if (response.first[ColumsApp.userverifycode].toString() == otp) {
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
