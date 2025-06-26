import 'dart:developer';
import 'dart:io';

import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/constants/link_app.dart';
import 'package:qabilati/feature/auth/data/api/auth_api.dart';
import 'package:qabilati/feature/auth/domain/repo_abs/repo_abs.dart';

class RepoImp extends RepoAbs {
  @override
  Future logIn(String value) async {
    var response = await AuthApi.selectEq(
      TablesApp.user,
      ColumsApp.userPhone,
      value,
    );
    return response;
  }

  @override
  Future register(Map data) async {
    var response = await AuthApi.insert(TablesApp.user, data);
    return response;
  }

  @override
  createVerifyAndSend(Map data, String value) async {
    try {
      await AuthApi.updateEq(TablesApp.user, data, ColumsApp.userPhone, value);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  checkVerifyCode(String phone) async {
    try {
      var response = await AuthApi.selectFilter(
        TablesApp.user,
        ColumsApp.userverifycode,
        ColumsApp.userPhone,
        phone,
      );
      return response;
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  uplaodImageUser(File file) async {
    try {
      var name = file.path.split("\\").last;
      await AuthApi.uploadFile(
        TablesApp.imageBucket,
        "${TablesApp.pathImageUser}${LocalStorageApp.getHiveData("user_data")['uuid']}/$name",
        file,
      );
      await AuthApi.updateEq(
        TablesApp.user,
        {
          "user_image":
              "${TablesApp.pathImageUser}${LocalStorageApp.getHiveData("user_data")['user_uuid']}/$name",
        },
        ColumsApp.useruuid,
        LocalStorageApp.getHiveData("user_data")['user_uuid'],
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
