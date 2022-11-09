// import 'dart:async';

// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';

// Future<String?> uploadImageWeb(PlatformFile file) async {
//   print('executing...');

//   try {
//     TaskSnapshot upload = await FirebaseStorage.instance
//         .ref('images/${FirebaseAuth.instance.currentUser!.uid}.jpg')
//         .putData(
//           file.bytes!,
//           SettableMetadata(contentType: 'image/${file.extension}'),
//         );

//     String url = await upload.ref.getDownloadURL();
//     return url;
//   } catch (e) {
//     EasyLoading.showError(e.toString());
//     print('error in uploading image for : ${e.toString()}');
//     return null;
//   }
// }
