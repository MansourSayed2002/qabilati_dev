import 'package:qabilati/core/class/supabase_connect.dart';

class PostsApi {
  static Future rpc({
    required String fn,
    required Map<String, dynamic>? params,
  }) async {
    return await SupabaseConnect.supabase.rpc(fn, params: params);
  }
}
