import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ItemImage extends StatelessWidget {
  final File fileImage;
  const ItemImage({super.key, required this.fileImage});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 80,
        width: 80,
        child: Image.file(
          fileImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
