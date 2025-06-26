import 'dart:io';

import 'package:qabilati/core/constants/link_app.dart';
import 'package:qabilati/feature/groub_chat/data/api/api_groub.dart';
import 'package:qabilati/feature/groub_chat/domain/repo_abs/groub_achat_repo_abs.dart';

class GroubChatRepoImp extends GroubchatRepoAbs {
  @override
  Future createNewGroub(Map<String, dynamic> data) async {
    return await ApiGroub.insert("groubs", data);
  }

  @override
  Future addMember(Map<String, dynamic> data) async {
    await ApiGroub.insert("members_of_group", data);
  }

  @override
  Future getGorubs(Map<String, dynamic>? params) async {
    var response = await ApiGroub.rPC("get_groubs", params);
    return response;
  }

  @override
  Future uploadFile(
    String name,
    File path,
    int groubId,
    Map<String, dynamic> data,
  ) async {
    await ApiGroub.uploadFile(TablesApp.imageBucket, name, path);
    await ApiGroub.update("groubs", data, "id", groubId);
  }

  @override
  Future getMembers(int groubId) async {
    var response = await ApiGroub.select("membersinfo", "groub_id", groubId);
    return response;
  }

  @override
  Future removeMembers(int id) async {
    await ApiGroub.delete("members_of_group", "id", id);
  }
}
