import 'package:qabilati/core/class/supabase_connect.dart';

class ChatsApi {
  static Future rpc(String nameFun, Map<String, dynamic>? params) async {
    final response = await SupabaseConnect.supabase.rpc(
      nameFun,
      params: params,
    );
    return response;
  }
}
