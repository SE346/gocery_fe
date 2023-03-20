import 'package:flutter/material.dart';
import 'package:grocery/data/models/address.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/res/style.dart';

class ItemAddress extends StatelessWidget {
  final Address address;
  final Function(String) callback;
  final bool isPrimary;
  const ItemAddress({
    super.key,
    required this.address,
    required this.callback,
    required this.isPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(address.displayName),
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: isPrimary
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColors.primary,
                ),
              )
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.displayName,
                    style: AppStyles.medium.copyWith(fontSize: 15),
                  ),
                  Text(
                    address.address,
                    style: AppStyles.regular.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ),
            isPrimary ? boxPrimary() : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget boxPrimary() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        'Primary',
        style: AppStyles.regular.copyWith(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}
