import 'package:qabilati/feature/friends/data/api/friend_api.dart';
import 'package:qabilati/feature/friends/domain/repo_abs/friend_repo_abs.dart';

class FriendRepoIpm extends FriendRepoAbs {
  @override
  Future getFriend(Map<String, dynamic> params) async {
    var response = await FriendApi.getFriend("get_friends", params);
    return response;
  }

  @override
  Future selectChatRoom(int value, int value2, Map data) async {
    var response = await FriendApi.selectChatRoom(
      "chats",
      "chat_user1",
      value,
      "chat_user2",
      value2,
      "chat_id",
      data,
    );
    return response;
  }

  @override
  Future getPendingFriendRequest(Map<String, dynamic> params) async {
    var response = await FriendApi.getFriend(
      "get_pending_friend_request",
      params,
    );
    return response;
  }

  @override
  Future acceptRequestFriend(int requestId, int replyId) async {
    await FriendApi.updateEq(
      "friend",
      {"friend_status": 1},
      "friend_request",
      requestId,
      "friend_reply",
      replyId,
    );
    await FriendApi.delete(
      "get_id_notifi",
      {"target_receiver_id": replyId, "target_sender_id": requestId},
      "notification",
      "id",
    );
  }

  @override
  Future rejectRequestFriend(int requestId, int replyId) async {
    await FriendApi.reject(
      "friend",
      "friend_request",
      requestId,
      "friend_reply",
      replyId,
    );
    await FriendApi.delete(
      "get_id_notifi",
      {"target_receiver_id": replyId, "target_sender_id": requestId},
      "notification",
      "id",
    );
  }
}
