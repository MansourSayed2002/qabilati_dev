import 'package:qabilati/feature/search/data/api/search_api.dart';
import 'package:qabilati/feature/search/domain/repo_abs/repo_abs.dart';

class RepoImpSearch extends RepoAbsSearch {
  @override
  getSearch(Map<String, dynamic>? params) async {
    var response = await SearchApi.getSearch('get_user_friends', params);
    return response;
  }
}
