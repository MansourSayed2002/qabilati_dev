import 'dart:math';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/constants/link_app.dart';
import 'package:qabilati/core/function/send_verifycode.dart';
import 'package:qabilati/feature/auth/domain/repo_abs/repo_abs.dart';

class CreateVerifyAndSendUsecase {
  CreateVerifyAndSendUsecase(this.repoAbst);
  late RepoAbs repoAbst;
  operationOfVerify() {
    var verifyCode = Random().nextInt(99999);
    if (verifyCode > 10000) {
      repoAbst.createVerifyAndSend({
        ColumsApp.userverifycode: verifyCode,
      }, LocalStorageApp.getHiveData(LocalStorageApp.userData).phone);
      sendVerifyCode(
        email: LocalStorageApp.getHiveData(LocalStorageApp.userData).email,
        message: verifyCode.toString(),
      );
    } else {
      operationOfVerify();
    }
  }
}
