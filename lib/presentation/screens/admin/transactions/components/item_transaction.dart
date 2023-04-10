import 'package:flutter/material.dart';
import 'package:grocery/data/models/transaction.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/screens/admin/transactions/components/item_tag.dart';

class ItemTransaction extends StatelessWidget {
  final Transaction transaction;

  const ItemTransaction({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ItemTag(orderStatus: transaction.orderStatus),
              const Spacer(),
              Text(
                transaction.createdAt,
                style: AppStyles.regular.copyWith(
                  color: AppColors.gray,
                  fontSize: 15,
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              itemColumn('Transaction ID', transaction.id),
              itemColumn('User', transaction.username),
              itemColumn('Total Payment', transaction.totalPayment),
            ],
          )
        ],
      ),
    );
  }

  Widget itemColumn(String key, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(key, style: AppStyles.regular),
        const SizedBox(height: 5),
        Text(value, style: AppStyles.medium)
      ],
    );
  }
}
