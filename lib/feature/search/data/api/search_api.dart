
import 'package:qabilati/core/class/supabase_connect.dart';

class SearchApi {
  static getSearch(String nameFun, Map<String, dynamic>? params) async {
    final response = await SupabaseConnect.supabase.rpc(
      nameFun,
      params: params,
    );
    return response;
  }
}
