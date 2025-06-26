import 'package:qabilati/feature/request_friend/data/api/request_friend_api.dart';
import 'package:qabilati/feature/request_friend/domain/repo_abs/repo_request_friend_abs.dart';

class RepoRequestFriendImp extends RepoRequestFriendAbs {
  @override
  Future<void> changeStatus(Map data, int id) async {
    await RequestFriendApi.changeStatus("friend", data, "id", id);
  }

  @override
  Future<void> unFriend(int value) async {
    await RequestFriendApi.unFriend("friend", "id", value);
  }

  @override
  Future<void> requestFriend(Map data) async {
    return await RequestFriendApi.requestFriend("friend", data);
  }
}
