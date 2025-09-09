import 'package:qabilati/feature/posts/data/api/posts_api.dart';
import 'package:qabilati/feature/posts/domain/repo_abs/post_repo_abs.dart';

class PostRepoImp extends PostRepoAbs {
  @override
  Future getPosts() async {
    return await PostsApi.rpc("get_all_posts");
  }
}
