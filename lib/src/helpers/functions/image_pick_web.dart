import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter/services.dart' show PlatformException;
import 'package:file_picker/file_picker.dart'
    show FilePicker, FileType, PlatformFile;

Future<PlatformFile?> filePickFromWeb() async {
  try {
    final file = await FilePicker.platform.pickFiles(type: FileType.image);
    if (file == null) return null;
    return file.files.first;
  } on PlatformException catch (e) {
    debugPrint('No Image found. Error: $e');
    return null;
  }
}
