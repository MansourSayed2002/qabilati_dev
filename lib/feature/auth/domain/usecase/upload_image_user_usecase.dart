import 'dart:developer';
import 'dart:io';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/constants/link_app.dart';
import 'package:qabilati/feature/auth/data/model/user_model.dart';
import 'package:qabilati/feature/auth/domain/repo_abs/repo_abs.dart';

class UploadImageUserUsecase {
  UploadImageUserUsecase(this.repoAbst);
  late RepoAbs repoAbst;
  upload(File file) async {
    try {
      var name = file.path.split("\\").last;
      String uuid = await LocalStorageApp.getSecureStorage(
        LocalStorageApp.uuidUser,
      );
      await repoAbst.uplaodImageUser(file);
      UserModel data = LocalStorageApp.getHiveData(LocalStorageApp.userData);
      LocalStorageApp.setHiveData(
        LocalStorageApp.userData,
        UserModel(
          email: data.email,
          id: data.id,
          username: data.username,
          phone: data.phone,
          image: "${TablesApp.pathImageUser}$uuid/$name",
        ),
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
