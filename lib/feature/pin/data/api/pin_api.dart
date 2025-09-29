import 'package:qabilati/core/class/supabase_connect.dart';
import 'package:qabilati/core/constants/link_app.dart';

class PinApi {
  static where({required int walletId}) async {
    return await SupabaseConnect.supabase
        .from(TablesApp.walletSecurity)
        .select('pin_hash')
        .eq(ColumsApp.walletId, walletId)
        .single();
  }
}
