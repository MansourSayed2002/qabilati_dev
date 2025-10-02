import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/posts/data/model/posts_model.dart';
import 'package:qabilati/feature/posts/domain/repo_abs/post_repo_abs.dart';

class GetAllPostsUsecase {
  GetAllPostsUsecase(this.postRepoAbs);

  late PostRepoAbs postRepoAbs;

  Future<ApiResult> getAllPosts({int offsetCount = 0}) async {
    try {
      List response = await postRepoAbs.getPosts(offsetCount: offsetCount);
      if (response.isNotEmpty) {
        return ApiSuccess(response.map((e) => PostModel.fromJson(e)).toList());
      } else {
        return ApiSuccess([]);
      }
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
