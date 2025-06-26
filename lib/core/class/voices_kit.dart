import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class VoicesKit {
  VoicesKit._internal();
  static final VoicesKit instance = VoicesKit._internal();

  final record = AudioRecorder();

  dispose() {
    record.dispose();
  }

  Future<void> startRecording(int chatRoomId) async {
    if (await record.hasPermission()) {
      Directory documentdir = await getApplicationDocumentsDirectory();
      String filaPath = p.join(
        documentdir.path,
        "recording${DateTime.now().millisecondsSinceEpoch}&$chatRoomId.wav",
      );
      await record.start(RecordConfig(), path: filaPath);
    }
  }

  Future<String?> stopRecording() async {
    return await record.stop();
  }
}
