import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/widgets/box.dart';

class ItemPaymentMethod extends StatelessWidget {
  final String img;
  final String method;

  const ItemPaymentMethod({
    super.key,
    required this.img,
    required this.method,
  });

  @override
  Widget build(BuildContext context) {
    return Box(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Image.asset(
            img,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Text(
            method,
            style: AppStyles.medium,
          ),
        ],
      ),
    );
  }
}
