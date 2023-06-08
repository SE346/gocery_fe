import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/data/models/address.dart';
import 'package:grocery/data/models/cart.dart';
import 'package:grocery/data/models/order.dart';
import 'package:grocery/data/models/payment.dart';
import 'package:grocery/presentation/helper/loading/loading_screen.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/res/images.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/screens/address/address_screen.dart';
import 'package:grocery/presentation/screens/checkout/components/box_address.dart';
import 'package:grocery/presentation/screens/checkout/components/box_time.dart';
import 'package:grocery/presentation/screens/checkout/components/item_payment_method.dart';
import 'package:grocery/presentation/screens/checkout/successful_checkout_screen.dart';
import 'package:grocery/presentation/screens/coupon/coupon_screen.dart';
import 'package:grocery/presentation/services/user/second_checkout_bloc/second_checkout_bloc.dart';
import 'package:grocery/presentation/utils/functions.dart';
import 'package:grocery/presentation/utils/money_extension.dart';
import 'package:grocery/presentation/widgets/box.dart';
import 'package:grocery/presentation/widgets/custom_app_bar.dart';
import 'package:grocery/presentation/widgets/custom_button.dart';

class SecondCheckOutScreen extends StatefulWidget {
  final double orderTotal;
  final List<Cart> carts;
  final bool isFromCart;

  const SecondCheckOutScreen({
    super.key,
    required this.orderTotal,
    required this.carts,
    required this.isFromCart,
  });

  @override
  State<SecondCheckOutScreen> createState() => _SecondCheckOutScreenState();
}

class _SecondCheckOutScreenState extends State<SecondCheckOutScreen> {
  SecondCheckoutBloc get _bloc => BlocProvider.of<SecondCheckoutBloc>(context);
  List<Payment> payments = [
    Payment(
      img: AppAssets.icCash,
      name: 'Payment By Cash',
    ),
    Payment(
      img: AppAssets.icCash,
      name: 'Payment By Zalo Pay',
    )
  ];
  String namePayment = "Payment By Cash";
  @override
  void initState() {
    super.initState();
    _bloc.add(SecondCheckoutStarted());
  }

  String valueCoupon = '';

  @override
  Widget build(BuildContext context) {
    double deliveryFee = 2;
    double vatFee = 0.1 * widget.orderTotal;

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
                GestureDetector(
                  onTap: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const AddressScreen(),
                      ),
                    );
                    if (result != null) {
                      _bloc.add(NewAddressChosen(newAddress: result));
                    }
                  },
                  child: BoxAddress(address: currentAddress),
                ),
                const SizedBox(height: 10),
                _buildDivider(),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Pick up time',
                    style: AppStyles.medium,
                  ),
                ),
                const SizedBox(height: 10),
                const BoxTime(),
                const SizedBox(height: 10),
                _buildDivider(),
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
                        widget.orderTotal.toDouble().toMoney,
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
                        deliveryFee.toDouble().toMoney,
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
                        'VAT (10%)',
                        style: AppStyles.regular,
                      ),
                      const Spacer(),
                      Text(
                        vatFee.toDouble().toMoney,
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
                        (widget.orderTotal + vatFee + deliveryFee).toMoney,
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
                    'Coupon',
                    style: AppStyles.semibold,
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    final result = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const CouponScreen(),
                      ),
                    );
                    if (result != null) {
                      setState(() {
                        valueCoupon = result;
                      });
                    }
                  },
                  child: Box(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Image.asset(
                          AppAssets.icCoupon,
                          width: 50,
                          height: 50,
                        ),
                        Text(
                          'Apply Coupon',
                          style: AppStyles.medium.copyWith(
                            fontSize: 15,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          valueCoupon,
                          style: AppStyles.regular.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
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
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    // spacing: 10,
                    // direction: Axis.vertical,
                    children: payments
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              setState(() {
                                namePayment = e.name;
                              });
                            },
                            child: ItemPaymentMethod(
                              payment: e,
                              isPicked: namePayment == e.name,
                            ),
                          ),
                        )
                        .toList(),
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
                        productList: widget.carts,
                      );
                      _bloc.add(CheckoutSubmitted(
                        order: order,
                        isFromCart: widget.isFromCart,
                      ));
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
