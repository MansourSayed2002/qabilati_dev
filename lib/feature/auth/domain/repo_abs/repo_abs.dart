import 'dart:io';

abstract class RepoAbs {
  logIn(String value);
  register(Map data);
  createVerifyAndSend(Map data, String value);
  checkVerifyCode(String phone);
  uplaodImageUser(File file);
}
