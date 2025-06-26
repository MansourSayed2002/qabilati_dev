import 'package:qabilati/core/class/supabase_connect.dart';

class RequestFriendApi {
  static Future<void> changeStatus(
    String table,
    Map data,
    String column,
    int value,
  ) async {
    await SupabaseConnect.supabase.from(table).update(data).eq(column, value);
  }

  static Future<void> unFriend(String table, String column, int value) async {
    await SupabaseConnect.supabase.from(table).delete().eq(column, value);
  }

  static Future requestFriend(String table, Map data) async {
    var response =
        await SupabaseConnect.supabase.from(table).insert(data).select();
    return response;
  }
}
