import 'dart:developer';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qabilati/core/class/supabase_connect.dart';
import 'package:qabilati/core/enum/type_file.dart';
import 'package:qabilati/core/function/upload_type_file.dart';

openAnyFiles({required TypeFileEnum typeFile, required String path}) async {
  try {
    final response = await SupabaseConnect.supabase.storage
        .from(bucketOfTypeFile(typeFile))
        .download(path);
    if (response.isNotEmpty) {
      final tempDir = await getApplicationDocumentsDirectory();
      final file = File('${tempDir.path}/$path');
      await file.create(recursive: true);
      await file.writeAsBytes(response);
      if (await file.exists()) {
        OpenFile.open(file.path);
      }
    }
  } catch (e) {
    log(e.toString());
  }
}
