import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/groub_chat/data/model/member_group_model.dart';
import 'package:qabilati/feature/groub_chat/domain/repo_abs/groub_achat_repo_abs.dart';

class GetGroupMembersUsecase {
  GetGroupMembersUsecase(this.groubChatRepoAbs);

  final GroubchatRepoAbs groubChatRepoAbs;

  Future<ApiResult> getGroupMembers(int groubId) async {
    try {
      List response = await groubChatRepoAbs.getMembers(groubId);
      if (response.isNotEmpty) {
        log(response.toString());
        List<MemberGroupModel> data = [];
        data.addAll(response.map((e) => MemberGroupModel.fromJson(e)));
        return ApiSuccess(data);
      } else {
        return ApiFailure(StatusRequest.nodatafailure);
      }
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
