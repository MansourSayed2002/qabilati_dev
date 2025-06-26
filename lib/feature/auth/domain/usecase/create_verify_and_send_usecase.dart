import 'dart:math';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/function/send_verifycode.dart';
import 'package:qabilati/feature/auth/domain/repo_abs/repo_abs.dart';

class CreateVerifyAndSendUsecase {
  CreateVerifyAndSendUsecase(this.repoAbst);
  late RepoAbs repoAbst;
  operationOfVerify() {
    var verifyCode = Random().nextInt(99999);
    if (verifyCode > 10000) {
      repoAbst.createVerifyAndSend({
        "user_verifycode": verifyCode,
      }, LocalStorageApp.getHiveData("user_data")['user_phone']);
      sendVerifyCode(
        email: LocalStorageApp.getHiveData("user_data")['user_emailgoogle'],
        message: verifyCode.toString(),
      );
    } else {
      operationOfVerify();
    }
  }
}
