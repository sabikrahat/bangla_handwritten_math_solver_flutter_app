import 'dart:io' show File;
import '../constants/constants.dart' show kPrimaryColor;
import 'package:flutter/material.dart' show Colors, debugPrint;
import 'package:flutter/services.dart' show PlatformException;
import 'package:image_cropper/image_cropper.dart'
    show
        AndroidUiSettings,
        CropAspectRatioPreset,
        CropStyle,
        CroppedFile,
        IOSUiSettings,
        ImageCropper;
import 'package:image_picker/image_picker.dart'
    show ImagePicker, ImageSource, XFile;

Future<File?> takeImageOption(
    {required ImageSource source, bool isCircle = false}) async {
  File? file;
  try {
    XFile? image = await ImagePicker().pickImage(
      source: source,
      imageQuality: 70,
    );
    if (image == null) return file;
    file = File(image.path);
  } on PlatformException catch (e) {
    file = null;
    debugPrint('No Image found. Error: $e');
  }

  debugPrint('Image Found: $file');

  //crop image
  if (file != null) {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: file.path,
      cropStyle: isCircle ? CropStyle.circle : CropStyle.rectangle,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop',
          toolbarColor: kPrimaryColor,
          toolbarWidgetColor: Colors.grey[350],
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Crop',
        ),
      ],
    );
    if (croppedFile != null) {
      file = File(croppedFile.path);
      debugPrint('Image Crop Found: $croppedFile');
      return file;
    }
  }
  return file;
}
