import 'package:qabilati/core/constants/link_app.dart';
import 'package:qabilati/feature/friends/data/api/friend_api.dart';
import 'package:qabilati/feature/friends/domain/repo_abs/friend_repo_abs.dart';

class FriendRepoIpm extends FriendRepoAbs {
  @override
  Future getFriend(Map<String, dynamic> params) async {
    var response = await FriendApi.getFriend(FuncAppDb.getFriends, params);
    return response;
  }

  @override
  Future selectChatRoom(int value, int value2, Map data) async {
    var response = await FriendApi.selectChatRoom(
      TablesApp.chats,
      ColumsApp.chatUser1,
      value,
      ColumsApp.chatUser2,
      value2,
      ColumsApp.chatID,
      data,
    );
    return response;
  }

  @override
  Future getPendingFriendRequest(Map<String, dynamic> params) async {
    var response = await FriendApi.getFriend(
      FuncAppDb.getPandingFriendsRequest,
      params,
    );
    return response;
  }

  @override
  Future acceptRequestFriend(int requestId, int replyId) async {
    await FriendApi.updateEq(
      TablesApp.friend,
      {ColumsApp.friendStatus: 1},
      ColumsApp.friendRequest,
      requestId,
      ColumsApp.friendReply,
      replyId,
    );
    await FriendApi.delete(
      FuncAppDb.getIdNotifi,
      {"target_receiver_id": replyId, "target_sender_id": requestId},
      TablesApp.notification,
      ColumsApp.notifiID,
    );
  }

  @override
  Future rejectRequestFriend(int requestId, int replyId) async {
    await FriendApi.reject(
      TablesApp.friend,
      ColumsApp.friendRequest,
      requestId,
      ColumsApp.friendReply,
      replyId,
    );
    await FriendApi.delete(
      FuncAppDb.getIdNotifi,
      {"target_receiver_id": replyId, "target_sender_id": requestId},
      TablesApp.notification,
      ColumsApp.notifiID,
    );
  }
}
