import 'package:qabilati/core/class/supabase_connect.dart';

class PostsApi {
  static Future<void> rpc(String fn) async {
    return await SupabaseConnect.supabase.rpc(fn);
  }
}
