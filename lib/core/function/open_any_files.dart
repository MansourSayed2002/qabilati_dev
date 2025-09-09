import 'dart:developer';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qabilati/core/class/supabase_connect.dart';
import 'package:qabilati/core/enum/type_file.dart';
import 'package:qabilati/core/function/upload_type_file.dart';
import 'package:http/http.dart' as http;

openAnyFiles({required TypeFileEnum typeFile, required String path}) async {
  try {
    final fileUrl = SupabaseConnect.supabase.storage
        .from(bucketOfTypeFile(typeFile))
        .getPublicUrl(path);
    final response = await http.get(Uri.parse(fileUrl));
    if (response.statusCode == 200) {
      final tempDir = await getApplicationDocumentsDirectory();
      final file = File('${tempDir.path}/$path');
      await file.create(recursive: true);
      await file.writeAsBytes(response.bodyBytes);
      if (await file.exists()) {
        OpenFile.open(file.path);
      }
    }
  } catch (e) {
    log(e.toString());
  }
}
