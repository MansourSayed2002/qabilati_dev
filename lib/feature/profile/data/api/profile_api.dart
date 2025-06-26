import 'package:qabilati/core/class/supabase_connect.dart';

class ProfileApi {
  static Future<String> getImage(path) async {
    String image = SupabaseConnect.supabase.storage
        .from('image')
        .getPublicUrl(path);
    return image;
  }
}
