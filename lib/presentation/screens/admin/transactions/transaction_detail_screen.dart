import 'package:flutter/material.dart';
import 'package:grocery/data/models/transaction.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/screens/admin/transactions/components/item_tag.dart';
import 'package:grocery/presentation/widgets/custom_app_bar.dart';

class TransactionDetailScreen extends StatelessWidget {
  final Transaction transaction;

  const TransactionDetailScreen({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Transaction Detail',
          style: AppStyles.bold.copyWith(
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ItemTag(orderStatus: transaction.orderStatus),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Transaction ID',
                        style: AppStyles.medium.copyWith(
                          color: AppColors.text.withOpacity(0.7),
                        ),
                      ),
                      const Spacer(),
                      Text(transaction.id, style: AppStyles.medium),
                    ],
                  ),
                  const Divider(color: AppColors.text),
                  Row(
                    children: [
                      Text(
                        'Customer',
                        style: AppStyles.medium.copyWith(
                          color: AppColors.text.withOpacity(0.7),
                        ),
                      ),
                      const Spacer(),
                      Text(transaction.username, style: AppStyles.medium),
                    ],
                  ),
                  const Divider(color: AppColors.text),
                  Row(
                    children: [
                      Text(
                        'Order Date',
                        style: AppStyles.medium.copyWith(
                          color: AppColors.text.withOpacity(0.7),
                        ),
                      ),
                      const Spacer(),
                      Text(transaction.createdAt, style: AppStyles.medium),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Address',
                    style: AppStyles.medium.copyWith(
                      color: AppColors.text.withOpacity(0.7),
                    ),
                  ),
                  Text('Mai Phạm Quốc Hưng', style: AppStyles.medium),
                  Text('374 Xô Viết Nghệ Tĩnh', style: AppStyles.medium),
                  Text('Quận Bình Thạnh, Hồ Chí Minh', style: AppStyles.medium),
                  Text('0399720685', style: AppStyles.medium),
                  const SizedBox(height: 10),
                  // ItemReviewOrder(product: product),
                  // ItemReviewOrder(product: product),
                  const Divider(color: AppColors.text),
                  Row(
                    children: [
                      Text('Quantity', style: AppStyles.medium),
                      const Spacer(),
                      Text('6', style: AppStyles.medium),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Sub Total', style: AppStyles.medium),
                      const Spacer(),
                      Text('\$60', style: AppStyles.medium),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Discount', style: AppStyles.medium),
                      const Spacer(),
                      Text('\$5', style: AppStyles.medium),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Delivery Fee', style: AppStyles.medium),
                      const Spacer(),
                      Text('\$5', style: AppStyles.medium),
                    ],
                  ),
                  const Divider(color: AppColors.text),
                  Row(
                    children: [
                      Text('Total Payment', style: AppStyles.bold),
                      const Spacer(),
                      Text('\$5', style: AppStyles.bold),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
