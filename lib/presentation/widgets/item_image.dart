import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ItemImage extends StatelessWidget {
  final Uint8List image;
  const ItemImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 80,
        width: 80,
        child: Image.memory(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
