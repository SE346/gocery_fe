import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/screens/admin/category/add_category_screen.dart';

class ItemAddCategory extends StatelessWidget {
  final int index;

  const ItemAddCategory({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    log('size of item add category: ${size.width} ${size.height}');

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const AddCategoryScreen(),
          ),
        );
      },
      child: SizedBox(
        width: size.width * .2,
        child: DottedBorder(
          dashPattern: const [8, 5],
          color: AppColors.primary,
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          padding: const EdgeInsets.all(0),
          child: const Center(
            child: Icon(
              Icons.add,
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
