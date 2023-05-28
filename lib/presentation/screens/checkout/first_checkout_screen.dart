import 'package:flutter/material.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/res/images.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/screens/checkout/components/item_payment_method.dart';
import 'package:grocery/presentation/screens/checkout/second_checkout_screen.dart';
import 'package:grocery/presentation/utils/money_extension.dart';
import 'package:grocery/presentation/widgets/custom_app_bar.dart';
import 'package:grocery/presentation/widgets/custom_button.dart';

class FirstCheckOutScreen extends StatelessWidget {
  final int orderTotal;
  const FirstCheckOutScreen({
    super.key,
    required this.orderTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Payment',
          style: AppStyles.bold.copyWith(
            fontSize: 19,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                Text(
                  'Order Total',
                  style: AppStyles.regular,
                ),
                const Spacer(),
                Text(
                  orderTotal.toMoney,
                  style: AppStyles.regular,
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                Text(
                  'Deliver Fee',
                  style: AppStyles.regular,
                ),
                const Spacer(),
                Text(
                  0.toMoney,
                  style: AppStyles.regular,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Total Payment',
                  style: AppStyles.bold,
                ),
                const Spacer(),
                Text(
                  orderTotal.toMoney,
                  style: AppStyles.bold,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 3,
            color: const Color(0xFFEEEEEE),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Choose Payment Method',
              style: AppStyles.medium,
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ItemPaymentMethod(
              img: AppAssets.icCash,
              method: 'Payment By Cash',
            ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ItemPaymentMethod(
              img: AppAssets.icCash,
              method: 'Payment By Zalo Pay',
            ),
          ),
          const Spacer(),
          SafeArea(
            child: CustomButton(
              content: 'Checkout',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => SecondCheckOutScreen(
                      orderTotal: orderTotal,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
