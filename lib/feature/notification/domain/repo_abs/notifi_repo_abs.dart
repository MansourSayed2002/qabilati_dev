abstract class NotifiRepoAbs {
  Future getnotificaions(int userId);
  Future rejectRequestFriend(int id, int requestId, int replyId);
  Future acceptRequestFriend(int id, int requestId, int replyId);
}
