import 'package:flutter/material.dart';
import 'package:grocery/data/models/coupon.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/widgets/box.dart';

class ItemCoupon extends StatelessWidget {
  final Coupon coupon;
  const ItemCoupon({
    super.key,
    required this.coupon,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Box(
      margin: const EdgeInsets.all(10),
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Image.network(
              'https://images.unsplash.com/photo-1682685795557-976f03aca7b2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
              fit: BoxFit.fitHeight,
              width: size.width * 0.3,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(coupon.couponType, style: AppStyles.medium),
                Text(
                  coupon.description,
                  style: AppStyles.regular.copyWith(
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      'Expired Date: ',
                      style: AppStyles.regular.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    Text(coupon.endDate, style: AppStyles.medium),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Quantity: ',
                      style: AppStyles.regular.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    Text(coupon.quantity.toString(), style: AppStyles.medium),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
