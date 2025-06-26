import 'dart:io';

abstract class GroubchatRepoAbs {
  Future createNewGroub(Map<String, dynamic> data);
  Future addMember(Map<String, dynamic> data);
  Future getGorubs(Map<String, dynamic>? params);
  Future uploadFile(
    String name,
    File path,
    int groubId,
    Map<String, dynamic> data,
  );
  Future getMembers(int groubId);
  Future removeMembers(int id);
}
