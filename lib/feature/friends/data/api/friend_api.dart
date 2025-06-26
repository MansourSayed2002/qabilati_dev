import 'package:qabilati/core/class/supabase_connect.dart';

class FriendApi {
  static Future getFriend(String nameFun, Map<String, dynamic>? params) async {
    final response = await SupabaseConnect.supabase.rpc(
      nameFun,
      params: params,
    );
    return response;
  }

  static Future getPendingFriendRequest(
    String nameFun,
    Map<String, dynamic>? params,
  ) async {
    final response = await SupabaseConnect.supabase.rpc(
      nameFun,
      params: params,
    );
    return response;
  }

  static Future selectChatRoom(
    String table,
    String column,
    int value,
    String column2,
    int value2,
    String selectColumn,
    Map data,
  ) async {
    List response = await SupabaseConnect.supabase
        .from(table)
        .select()
        .eq(column, value)
        .eq(column2, value2);
    if (response.isEmpty) {
      var chatId = await SupabaseConnect.supabase
          .from(table)
          .insert(data)
          .select(selectColumn);
      return chatId;
    } else {
      return response.first['chat_id'];
    }
  }

  static updateEq(
    String table,
    Map data,
    String column,
    int value,
    String column2,
    int value2,
  ) async {
    var response = await SupabaseConnect.supabase
        .from(table)
        .update(data)
        .eq(column, value)
        .eq(column2, value2)
        .select("id");
    return response;
  }

  static delete(
    String nameFun,
    Map<String, dynamic>? params,
    String table,
    String column,
  ) async {
    List id = await SupabaseConnect.supabase.rpc(nameFun, params: params);
    await SupabaseConnect.supabase
        .from(table)
        .delete()
        .eq(column, id.first['id']);
  }

  static reject(
    String table,
    String column,
    int value,
    String column2,
    int value2,
  ) async {
    var response = await SupabaseConnect.supabase
        .from(table)
        .delete()
        .eq(column, value)
        .eq(column2, value2);
    return response;
  }
}
