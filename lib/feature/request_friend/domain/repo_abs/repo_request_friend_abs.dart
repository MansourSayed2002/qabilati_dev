abstract class RepoRequestFriendAbs {
  Future<void> changeStatus(Map data, int id);
  Future<void> unFriend(int value);
  Future requestFriend(Map data);
}
