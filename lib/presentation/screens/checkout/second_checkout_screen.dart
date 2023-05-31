import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/data/models/address.dart';
import 'package:grocery/data/models/cart.dart';
import 'package:grocery/data/models/order.dart';
import 'package:grocery/presentation/helper/loading/loading_screen.dart';
import 'package:grocery/presentation/res/images.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/screens/checkout/components/box_address.dart';
import 'package:grocery/presentation/screens/checkout/components/item_payment_method.dart';
import 'package:grocery/presentation/screens/checkout/successful_checkout_screen.dart';
import 'package:grocery/presentation/services/user/second_checkout_bloc/second_checkout_bloc.dart';
import 'package:grocery/presentation/utils/functions.dart';
import 'package:grocery/presentation/utils/money_extension.dart';
import 'package:grocery/presentation/widgets/custom_app_bar.dart';
import 'package:grocery/presentation/widgets/custom_button.dart';

class SecondCheckOutScreen extends StatefulWidget {
  final int orderTotal;
  const SecondCheckOutScreen({
    super.key,
    required this.orderTotal,
  });

  @override
  State<SecondCheckOutScreen> createState() => _SecondCheckOutScreenState();
}

class _SecondCheckOutScreenState extends State<SecondCheckOutScreen> {
  SecondCheckoutBloc get _bloc => BlocProvider.of<SecondCheckoutBloc>(context);

  @override
  void initState() {
    super.initState();
    _bloc.add(SecondCheckoutStarted());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Checkout',
          style: AppStyles.bold.copyWith(
            fontSize: 19,
          ),
        ),
      ),
      body: BlocConsumer<SecondCheckoutBloc, SecondCheckoutState>(
        listener: (context, state) {
          if (state is SecondCheckoutLoading) {
            LoadingScreen().show(context: context);
          } else if (state is SecondCheckoutFailure) {
            LoadingScreen().hide();
            showSnackBar(
              context,
              state.errorMessage,
              const Icon(Icons.error_outline),
            );
          } else if (state is SecondCheckoutSuccess) {
            LoadingScreen().hide();
          } else if (state is OrderSuccess) {
            LoadingScreen().hide();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => SuccessfulCheckOutScreen(
                  name: state.name,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is SecondCheckoutSuccess) {
            Address currentAddress = state.currentAddress;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Destination',
                    style: AppStyles.medium,
                  ),
                ),
                const SizedBox(height: 10),
                _buildDivider(),
                const SizedBox(height: 10),
                BoxAddress(
                  address: currentAddress,
                ),
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
                        widget.orderTotal.toMoney,
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
                        widget.orderTotal.toMoney,
                        style: AppStyles.bold,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                _buildDivider(),
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
                      Order order = Order(
                        phoneNum: currentAddress.phoneNum,
                        addressId: currentAddress.id!,
                        deliveryDate: DateTime.now().toUtc().toIso8601String(),
                        paymentMethod: 'Credit',
                        productList: state.carts,
                      );
                      _bloc.add(CheckoutSubmitted(order: order));
                    },
                  ),
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: double.infinity,
      height: 3,
      color: const Color(0xFFEEEEEE),
    );
  }
}
