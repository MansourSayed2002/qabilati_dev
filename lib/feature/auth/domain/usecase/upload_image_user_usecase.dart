import 'dart:developer';
import 'dart:io';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/constants/link_app.dart';
import 'package:qabilati/feature/auth/domain/repo_abs/repo_abs.dart';

class UploadImageUserUsecase {
  UploadImageUserUsecase(this.repoAbst);
  late RepoAbs repoAbst;
  upload(File file) async {
    try {
      await repoAbst.uplaodImageUser(file);
      LocalStorageApp.setHiveData("user_data", {
        "user_name": LocalStorageApp.getHiveData("user_data")['user_name'],
        "user_emailgoogle":
            LocalStorageApp.getHiveData("user_data")['user_emailgoogle'],
        "user_phone": LocalStorageApp.getHiveData("user_data")['user_phone'],
        "user_id": LocalStorageApp.getHiveData("user_data")['user_id'],
        "user_image":
            "${TablesApp.pathImageUser}${LocalStorageApp.getHiveData("user_data")['user_uuid']}/${file.path.split("\\").last}",
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
