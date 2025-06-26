import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/chats/data/model/chats_model.dart';
import 'package:qabilati/feature/chats/domain/repo_abs/chats_repo_abs.dart';

class GetChatsUsecase {
  GetChatsUsecase(this.chatsRepoAbs);
  late ChatsRepoAbs chatsRepoAbs;

  Future<ApiResult> getChats() async {
    try {
      List response = await chatsRepoAbs.getchats({
        "target_user_id": LocalStorageApp.getHiveData("user_data")['user_id'],
      });
      if (response.isNotEmpty) {
        List<ChatsModel> data = [];
        data.addAll(response.map((e) => ChatsModel.fromJson(e)));
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
