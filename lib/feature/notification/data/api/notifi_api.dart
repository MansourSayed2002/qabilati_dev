import 'package:qabilati/core/class/supabase_connect.dart';

class NotifiApi {
  static selectEq(String table, String column, int value) async {
    var response = await SupabaseConnect.supabase
        .from(table)
        .select('*, user!notification_notifi_sender_fkey (user_image)')
        .eq(column, value);
    return response;
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
        .eq(column2, value2);
    return response;
  }

  static delete(String table, String column, int value) async {
    var response = await SupabaseConnect.supabase
        .from(table)
        .delete()
        .eq(column, value);
    return response;
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
