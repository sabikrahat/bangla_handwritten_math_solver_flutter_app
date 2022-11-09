import 'dart:io' show File;

import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        Column,
        EdgeInsets,
        FontWeight,
        Icon,
        Icons,
        ListTile,
        MainAxisSize,
        Navigator,
        Padding,
        Radius,
        RoundedRectangleBorder,
        Text,
        TextAlign,
        TextStyle,
        showModalBottomSheet;
import 'package:image_picker/image_picker.dart' show ImageSource;

import '../../localization/loalization.dart' show t;
import 'take_image_option.dart' show takeImageOption;

Future<File?> modalBottomSheetMenu(
    {required BuildContext context, bool isCircle = false}) async {
  File? file;
  return showModalBottomSheet(
    elevation: 2.0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
    ),
    context: context,
    builder: (builder) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Text(
              t!.chooseAnOption,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.photo_camera),
            title: Text(t!.captureImageWithCamera),
            onTap: () async {
              file = await takeImageOption(
                source: ImageSource.camera,
                isCircle: isCircle,
              );
              if (file != null) {
                // ignore: use_build_context_synchronously
                Navigator.pop(context, file);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: Text(t!.selectImageFromGallery),
            onTap: () async {
              file = await takeImageOption(
                source: ImageSource.gallery,
                isCircle: isCircle,
              );
              if (file != null) {
                // ignore: use_build_context_synchronously
                Navigator.pop(context, file);
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.cancel),
            title: Text(t!.cancel),
            onTap: () {
              Navigator.pop(context, file);
            },
          ),
        ],
      );
    },
  );
}
