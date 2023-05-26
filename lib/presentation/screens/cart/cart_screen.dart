import 'package:flutter/material.dart';
import 'package:grocery/presentation/res/style.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.3,
        centerTitle: false,
        title: Text(
          'Order Review',
          style: AppStyles.bold.copyWith(
            fontSize: 19,
          ),
        ),
      ),
      body: Center(
        child: Text('Cart'),
      ),
    );
    ;
  }
}
