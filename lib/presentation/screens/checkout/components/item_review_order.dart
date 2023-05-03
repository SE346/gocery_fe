import 'package:flutter/material.dart';
import 'package:grocery/data/models/product.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/widgets/edit_product_cart.dart';

class ItemReviewOrder extends StatelessWidget {
  final Product product;
  const ItemReviewOrder({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Image.asset(
            product.productImgList![0].imgUrl,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.productName,
                  style: AppStyles.regular.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  '\$${product.price} / ${product.unit}',
                  style: AppStyles.regular.copyWith(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '\$10',
                  style: AppStyles.semibold.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const EditProductCart(),
        ],
      ),
    );
  }
}
