import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/search/domain/repo_abs/repo_abs.dart';

class GetSearchUsecase {
  late RepoAbsSearch repoAbsSearch;
  GetSearchUsecase(this.repoAbsSearch);

  Future<ApiResult> getSearch(String search) async {
    try {
      List response = await repoAbsSearch.getSearch({
        'target_user_id': LocalStorageApp.getHiveData('user_data')['user_id'],
        'name_prefix': search,
      });
      if (response.isNotEmpty) {
        return ApiSuccess(response);
      } else {
        return ApiFailure(StatusRequest.failure);
      }
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
