import 'package:qabilati/core/constants/link_app.dart';
import 'package:qabilati/core/enum/type_file.dart';

int uploadTypeFile(TypeFileEnum typeFile) {
  switch (typeFile) {
    case TypeFileEnum.text:
      return 0;
    case TypeFileEnum.camera:
      return 2;
    case TypeFileEnum.gallery:
      return 2;
    case TypeFileEnum.pdf:
      return 4;
    case TypeFileEnum.music:
      return 6;
    case TypeFileEnum.location:
      return 5;
    case TypeFileEnum.video:
      return 3;
    case TypeFileEnum.record:
      return 1;
  }
}

String bucketOfTypeFile(TypeFileEnum typeFile) {
  switch (typeFile) {
    case TypeFileEnum.camera || TypeFileEnum.gallery:
      return TablesApp.imageBucket;
    case TypeFileEnum.pdf:
      return TablesApp.pdfBucket;
    case TypeFileEnum.music:
      return TablesApp.musicBucket;
    case TypeFileEnum.video:
      return TablesApp.videoBucket;
    case TypeFileEnum.record:
      return TablesApp.recordBucket;
    case TypeFileEnum.text:
      return "";
    case TypeFileEnum.location:
      return "";
  }
}

String bucketPathOfFile(TypeFileEnum typeFile) {
  switch (typeFile) {
    case TypeFileEnum.camera || TypeFileEnum.gallery:
      return TablesApp.pathImageshared;
    case TypeFileEnum.pdf:
      return TablesApp.pathPdfshared;
    case TypeFileEnum.music:
      return TablesApp.musicBucket;
    case TypeFileEnum.video:
      return TablesApp.pathVideoshared;
    case TypeFileEnum.record:
      return TablesApp.pathRecordshared;
    case TypeFileEnum.text:
      return "";
    case TypeFileEnum.location:
      return "";
  }
}
