import 'package:flutter/material.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/res/style.dart';

class EditProductCart extends StatelessWidget {
  const EditProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        iconEdit(
          const Positioned(
            bottom: 7,
            child: Icon(
              Icons.minimize,
              size: 17,
              color: AppColors.primary,
            ),
          ),
          () {},
        ),
        const SizedBox(width: 10),
        Text('5', style: AppStyles.bold),
        const SizedBox(width: 10),
        iconEdit(
          const Icon(
            Icons.add,
            size: 17,
            color: AppColors.primary,
          ),
          () {},
        ),
      ],
    );
  }

  Widget iconEdit(Widget child, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primary,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
