import 'package:qabilati/feature/notification/data/api/notifi_api.dart';
import 'package:qabilati/feature/notification/domain/repo_abs/notifi_repo_abs.dart';

class NotifiRepoImp extends NotifiRepoAbs {
  @override
  Future getnotificaions(int userId) async {
    List response = await NotifiApi.selectEq(
      "notification",
      "notifi_receiver",
      userId,
    );
    return response;
  }

  @override
  Future acceptRequestFriend(int notifiId, int requestId, int replyId) async {
    await NotifiApi.updateEq(
      "friend",
      {"friend_status": 1},
      "friend_request",
      requestId,
      "friend_reply",
      replyId,
    );
    await NotifiApi.delete("notification", "id", notifiId);
  }

  @override
  Future rejectRequestFriend(int id, int requestId, int replyId) async {
    await NotifiApi.delete("notification", "id", id);
    await NotifiApi.reject(
      "friend",
      "friend_request",
      requestId,
      "friend_reply",
      replyId,
    );
  }
}
