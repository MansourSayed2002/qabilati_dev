import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/constants/link_app.dart';
import 'package:qabilati/feature/auth/data/model/user_model.dart';
import 'package:qabilati/feature/posts/data/api/posts_api.dart';
import 'package:qabilati/feature/posts/domain/repo_abs/post_repo_abs.dart';

class PostRepoImp extends PostRepoAbs {
  @override
  Future getPosts({int offsetCount = 0}) async {
    UserModel user = LocalStorageApp.getHiveData(LocalStorageApp.userData);
    return await PostsApi.rpc(
      fn: FuncAppDb.getFriendPosts,
      params: {"my_user_id": user.id, "offset_count": offsetCount},
    );
  }
}
