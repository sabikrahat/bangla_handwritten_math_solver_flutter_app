// import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';

// Future<String?> uploadImageMobile(File? file) async {
//   //
//   if (file == null) return null;

//   try {
//     final ref = FirebaseStorage.instance.ref().child(
//           'images/${FirebaseAuth.instance.currentUser!.uid}.jpg',
//         );
//     UploadTask? uploadTask = ref.putFile(file);

//     final snapshot = await uploadTask.whenComplete(() {});

//     final downloadUrl = await snapshot.ref.getDownloadURL();

//     print('Photo uploaded. Url: $downloadUrl');

//     return downloadUrl;
//   } catch (e) {
//     EasyLoading.showError(e.toString());
//     print('error in uploading image for : ${e.toString()}');
//     return null;
//   }
// }
