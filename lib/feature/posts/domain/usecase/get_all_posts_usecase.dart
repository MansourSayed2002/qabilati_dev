import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/posts/data/model/posts_model.dart';
import 'package:qabilati/feature/posts/domain/repo_abs/post_repo_abs.dart';

class GetAllPostsUsecase {
  GetAllPostsUsecase(this.postRepoAbs);

  late PostRepoAbs postRepoAbs;

  Future<ApiResult> getAllPosts() async {
    try {
      List response = await postRepoAbs.getPosts();
      if (response.isNotEmpty) {
        List<PostsModel> data = [];
        data.addAll(response.map((e) => PostsModel.fromJson(e)));
        return ApiSuccess(data);
      } else {
        return ApiFailure(StatusRequest.nodatafailure);
      }
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
