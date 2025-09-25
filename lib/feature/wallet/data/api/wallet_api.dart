import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:qabilati/core/class/http_manager.dart';
import 'package:qabilati/core/class/supabase_connect.dart';

class WalletApi {
  static rpc({
    required String nameFun,
    required Map<String, dynamic>? params,
  }) async {
    return await SupabaseConnect.supabase.rpc(nameFun, params: params);
  }

  static insert({required String table, required Map values}) async {
    return await SupabaseConnect.supabase.from(table).insert(values).select();
  }

  static update({
    required String table,
    required Map values,
    required String column,
    required int value,
  }) async {
    await SupabaseConnect.supabase.from(table).update(values).eq(column, value);
  }

  static select({
    required String table,
    required String column,
    required int value,
  }) async {
    return await SupabaseConnect.supabase
        .from(table)
        .select()
        .eq(column, value);
  }

  static invoke({required String body, required String baseUrl}) async {
    var result = await HttpManager.postMethod(
      baseUrl: baseUrl,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${dotenv.env['SUPABASE_ANON_KEY']}",
      },
      body: body,
    );
    return result;
  }
}
