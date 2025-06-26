import 'package:qabilati/feature/chats/data/api/chats_api.dart';
import 'package:qabilati/feature/chats/domain/repo_abs/chats_repo_abs.dart';

class ChatsRepoImp extends ChatsRepoAbs {
  @override
  Future getchats(Map<String, dynamic>? params) async {
    return await ChatsApi.rpc("get_chats", params);
  }
}
