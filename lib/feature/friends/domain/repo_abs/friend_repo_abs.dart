abstract class FriendRepoAbs {
  Future getFriend(Map<String, dynamic> params);
  Future getPendingFriendRequest(Map<String, dynamic> params);
  Future selectChatRoom(int value, int value2, Map data);
  Future rejectRequestFriend( int requestId, int replyId);
  Future acceptRequestFriend( int requestId, int replyId);
}
