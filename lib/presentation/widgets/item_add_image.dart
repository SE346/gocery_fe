import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:image_picker/image_picker.dart';

class ItemAddImage extends StatelessWidget {
  final Function(File) callback;

  const ItemAddImage({
    super.key,
    required this.callback,
  });

  void pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      callback(file);
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pickImage,
      child: SizedBox(
        width: 80,
        height: 80,
        child: DottedBorder(
          dashPattern: const [8, 5],
          color: AppColors.primary,
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          padding: const EdgeInsets.all(0),
          child: const Center(
            child: Icon(
              Icons.camera_alt,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
