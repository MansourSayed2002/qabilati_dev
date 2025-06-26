import 'package:qabilati/core/class/local_storage.dart';

String chooseImageBar(String imageLight, String imageDark) {
  if (LocalStorageApp.getData("theme") == "dark") {
    return imageDark;
  } else {
    return imageLight;
  }
}
