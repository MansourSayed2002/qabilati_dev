import 'dart:developer';
import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/groub_chat/domain/repo_abs/groub_achat_repo_abs.dart';

class DeleteMembersUsecase {
  DeleteMembersUsecase(this.groubChatRepoAbs);

  final GroubchatRepoAbs groubChatRepoAbs;

  Future<ApiResult> removeMembers(int id) async {
    try {
      await groubChatRepoAbs.removeMembers(id);

      return ApiSuccess(StatusRequest.success);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
