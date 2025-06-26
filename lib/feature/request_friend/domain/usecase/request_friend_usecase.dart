import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/request_friend/domain/repo_abs/repo_request_friend_abs.dart';

class RequestFriendUsecase {
  RequestFriendUsecase(this.repoRequestFriendAbs);
  late RepoRequestFriendAbs repoRequestFriendAbs;

  Future<ApiResult> requestFriend(int friendReply) async {
    try {
      List response = await repoRequestFriendAbs.requestFriend({
        "friend_status": 0,
        "friend_reply": friendReply,
        "friend_request": LocalStorageApp.getHiveData("user_data")['user_id'],
      });
      return ApiSuccess(response.first);
    } catch (e) {
      return ApiFailure(StatusRequest.failure);
    }
  }
}
