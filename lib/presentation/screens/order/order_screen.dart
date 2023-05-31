import 'package:flutter/material.dart';
import 'package:grocery/presentation/res/style.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.3,
        centerTitle: false,
        title: Text(
          'Order',
          style: AppStyles.bold.copyWith(
            fontSize: 19,
          ),
        ),
      ),
      body: Center(
        child: Text('Order'),
      ),
    );
    ;
  }
}
