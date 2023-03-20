import 'package:flutter/material.dart';
import 'package:grocery/data/models/product.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/res/style.dart';

class ItemProduct extends StatelessWidget {
  final Product product;

  const ItemProduct({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // // image
        Expanded(
          child: Image.asset(
            product.images[0],
            alignment: Alignment.center,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(height: 10),
        // name
        Text(
          product.name,
          style: AppStyles.medium,
        ),
        // unit
        Text(
          '${product.unit}/pack',
          style: AppStyles.regular.copyWith(color: AppColors.gray),
        ),
        const SizedBox(height: 5),
        // original price
        Text(
          '\$${product.price}',
          style: AppStyles.regular.copyWith(
            fontSize: 15,
            decoration: product.hasDiscount ? TextDecoration.lineThrough : null,
            color: product.hasDiscount ? AppColors.text : AppColors.secondary,
          ),
        ),
        const SizedBox(height: 5),
        if (product.hasDiscount)
          Text(
            '\$${product.price * product.discount}',
            style: AppStyles.medium.copyWith(
              color: AppColors.secondary,
              fontSize: 17,
            ),
          ),
      ],
    );
  }
}
