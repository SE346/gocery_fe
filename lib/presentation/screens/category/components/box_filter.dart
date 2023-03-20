import 'package:flutter/material.dart';
import 'package:grocery/presentation/res/style.dart';

class BoxFilter extends StatelessWidget {
  const BoxFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Filter', style: AppStyles.semibold),
        const SizedBox(height: 20),
      ],
    );
  }
}
