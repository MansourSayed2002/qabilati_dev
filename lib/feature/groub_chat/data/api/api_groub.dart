import 'dart:io';
import 'package:qabilati/core/class/supabase_connect.dart';

class ApiGroub {
  static insert(String table, Map data) async {
    return SupabaseConnect.supabase.from(table).insert(data).select();
  }

  static select(String table, String column, int value) async {
    return SupabaseConnect.supabase.from(table).select().eq(column, value);
  }

  static delete(String table, String column, int value) async {
    return SupabaseConnect.supabase.from(table).delete().eq(column, value);
  }

  static update(
    String table,
    Map<dynamic, dynamic> data,
    String column,
    int value,
  ) async {
    return SupabaseConnect.supabase.from(table).update(data).eq(column, value);
  }

  static uploadFile(String buckets, String path, File file) async {
    await SupabaseConnect.supabase.storage.from(buckets).upload(path, file);
  }

  static Future rPC(String nameFun, Map<String, dynamic>? params) async {
    final response = await SupabaseConnect.supabase.rpc(
      nameFun,
      params: params,
    );
    return response;
  }
}
