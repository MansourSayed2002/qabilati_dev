import 'dart:io';

import 'package:qabilati/core/class/supabase_connect.dart';

class ChatRoomApi {
  static insert(String table, Map data) async {
    return SupabaseConnect.supabase.from(table).insert(data);
  }

  static uploadFile(String buckets, String path, File file) async {
    await SupabaseConnect.supabase.storage.from(buckets).upload(path, file);
  }

  static downloadFile(String buckets, String path) async {
    await SupabaseConnect.supabase.storage.from(buckets).download(path);
  }
}
